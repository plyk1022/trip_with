class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only: [:edit]

  def new
    @post = Post.new
    @post.prefecture_relations.build
  end

  def form
    @post = Post.new(post_params)

    if @post.start_date > @post.end_date
      flash.now[:alert] = '終了日は開始日より遅い日付を入力してください'
      render 'new'
    end

    @trip_days = (@post.end_date - @post.start_date).to_i + 1
    date = @post.start_date

    @trip_days.times do
      schedule = @post.schedules.build
      schedule.spots.build

      schedule.date = date
      date = date + 1
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if params[:commit] == '下書きに保存'
      @post.status = 1
      if @post.save
        flash[:notice] = "タイトル「#{post_params[:title]}」を下書きに保存しました。"
        redirect_to post_path(@post)
      else
        flash.now[:alert] = '入力内容を確認してください'
        render 'form'
      end
    else
      if @post.save
        flash[:notice] = "タイトル「#{post_params[:title]}」を投稿しました。"
        redirect_to post_path(@post)
      else
        flash.now[:alert] = '入力内容を確認してください'
        render 'form'
      end
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "タイトル「#{@post.title}」を削除しました"
    redirect_to posts_path
  end

  def index
    @prefectures = Prefecture.all
    @posts = Post.where(status: 0).order(created_at: 'DESC').page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      if params[:commit] == '投稿'
        @post.update(status: 0)
        flash[:notice] = "タイトル「#{post_params[:title]}」の編集内容を保存しました。"
      else
        @post.update(status: 1)
        flash[:notice] = "タイトル「#{post_params[:title]}」を下書きに保存しました。"
      end
      redirect_to post_path(@post)
    else
      flash[:alert] = '入力内容を確認してください。'
      render 'form'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :start_date, :end_date, prefecture_ids: [],
                                  schedules_attributes:[:id, :date, :_destroy,
                                  spots_attributes:[:id, :name, :comment, :arriving_time, :leaving_time, :spot_image, :_destroy]])
  end

  def ensure_current_user
    @post = Post.find(params[:id])
    redirect_to posts_path  unless @post.user == current_user
  end

end
