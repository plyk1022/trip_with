class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @post = Post.find(params[:id])
   
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def destroy
    user = Post.find(params[:id]).user
    Post.find(params[:id]).destroy
    redirect_to  admin_user_path(user)
  end
  
end
