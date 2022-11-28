class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @post.prefecture_relations.build
  end

  def form
    @post = Post.new(post_params)

    # 開始日と終了日の内容チェック
    if @post.start_date > @post.end_date
      flash.now[:alert] = '終了日は開始日より遅い日付を入力してください'
      render 'new'
    end

    # 開始日と入力日から旅行日数を計算、日数分のフォームを作成
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

    # 「下書きに保存」ボタンの場合
    if params[:commit] == '下書きに保存'
      @post.status = 1
      if @post.save
        flash[:notice] = "タイトル「#{post_params[:title]}」を下書きに保存しました"
        redirect_to post_path(@post)
      else
        flash.now[:alert] = '入力内容を確認してください'
        render 'form'
      end
    # 「投稿」ボタンの場合
    else
      if @post.save(context: :published)
        flash[:notice] = "タイトル「#{post_params[:title]}」を投稿しました"
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
    ensure_current_user if @post.status == 1
    @post_comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    # 「下書きに保存」ボタンの場合
    if params[:commit] == '下書きに保存'
      @post.attributes = post_params.merge(status: 1)
      if @post.save
        flash[:notice] = "タイトル「#{post_params[:title]}」を下書きに保存しました"
        redirect_to post_path(@post)
      else
        flash.now[:alert] = '入力内容を確認してください'
        render 'form'
      end
    # 「投稿」ボタンの場合
    else
      @post.attributes = post_params.merge(status: 0)
      if @post.save(context: :published)
        flash[:notice] = "タイトル「#{post_params[:title]}」を投稿しました"
        redirect_to post_path(@post)
      else
        flash.now[:alert] = '入力内容を確認してください'
        render 'form'
      end
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
