class Admin::CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
  end
  
  def destroy
    user = Comment.find(params[:id]).user
    Comment.find(params[:id]).destroy
    redirect_to admin_user_path(user)
  end
  
end
