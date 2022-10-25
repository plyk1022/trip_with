class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(status: 0).page(params[:page]).per(10)
    
    
    @comments = @user.comments.page(params[:page]).per(10)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end



  private

  def user_params
    params.require(:user).permit(:is_deleted)
  end

end
