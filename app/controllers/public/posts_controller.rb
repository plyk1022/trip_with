class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
    @post.prefecture_relations.build
    
  end
  
  def form
    @post = Post.new(post_params)
    
    @trip_days = (@post.end_date - @post.start_date).to_i + 1
    
    date = @post.start_date
    
    @trip_days.times do
      schedule = @post.schedules.build
      3.times{ schedule.spots.build }
      
      
      schedule.date = date
      date = date + 1
    end
    
    
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
    params.require(:post).permit(:title, :body, :start_date, :end_date,
                                  prefecture_relations_attributes:[:id, :prefecture_id, :_destroy],
                                  schedules_attributes:[:id, :date, :_destroy, 
                                  spots_attributes:[:id, :name, :comment, :arriving_time, :leaving_time, :image, :_destroy]])
  end
end
