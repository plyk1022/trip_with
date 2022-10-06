class Admin::CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_comments_path
  end
  
end
