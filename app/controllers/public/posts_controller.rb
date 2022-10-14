class Public::PostsController < ApplicationController
  before_action :correct_user, only: [:edit]

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


    if params[:commit] == '投稿'
      if @post.save
        redirect_to post_path(@post)
      else
        render 'form'
      end
    else
      @post.status = 1
      @post.save(validate: false)
      redirect_to posts_path
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def index
    @prefectures = Prefecture.all
    @posts = Post.page(params[:page])
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
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :start_date, :end_date, prefecture_ids: [],
                                  schedules_attributes:[:id, :date, :_destroy,
                                  spots_attributes:[:id, :name, :comment, :arriving_time, :leaving_time, :spot_image, :_destroy]])
  end

  def correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to(posts_path) unless @user == current_user
  end

end
