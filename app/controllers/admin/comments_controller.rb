class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @comments = Comment.all.page(params[:page]).per(10)
  end
  
  def show
    @user = User.find(params[:id])

    
    @comments = @user.comments.page(params[:page]).per(10)
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to request.referer
  end
  
end
