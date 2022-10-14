class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @comments = Comment.all
  end
  
  def destroy
    user = Comment.find(params[:id]).user
    Comment.find(params[:id]).destroy
    redirect_to admin_user_path(user)
  end
  
end
