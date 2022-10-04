class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
    @post.prefecture_relations.build
    schedule = @post.schedules.build
    3.times{
      schedule.spots.build }
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to new_post_path
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
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
    params.require(:post).permit(:title, :body,
                                  prefecture_relations_attributes:[:id, :prefecture_id, :_destroy],
                                  schedules_attributes:[:id, :day, :_destroy, 
                                  spots_attributes:[:id, :name, :comment, :arriving_time, :leaving_time, :_destroy]])
  end
end
