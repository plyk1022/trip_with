class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "タイトル「#{post.title}」を削除しました"
    redirect_to  admin_root_path
  end
  
end
