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
    end

    if @post.save
      redirect_to post_path(@post)
    else
      render 'form'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def index
    @prefectures = Prefecture.all
    @posts = Post.where(status: 0).order(created_at: "DESC").page(params[:page])
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
      else
        @post.update(status: 1)
      end
      
      redirect_to post_path(@post)
    else
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
