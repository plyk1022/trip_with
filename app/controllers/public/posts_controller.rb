class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
    schedule = @post.schedules.build
    schedule.spots.build
    
    
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to new_post_path
  end

  def index
  end

  def show
  end
  
  
  private
  def post_params
    params.require(:post).permit(:title, :body,
                                  schedules_attributes:[:id, :day, :_destroy, 
                                  spots_attributes:[:id, :name, :comment, :arriving_time, :leaving_time, :_destroy]])
  end
end
