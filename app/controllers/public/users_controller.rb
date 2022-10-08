class Public::UsersController < ApplicationController
  before_action :correct_user, only: [:edit]
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(posts_path) unless @user == current_user
  end
  
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "ゲストユーザー"
      redirect_to posts_path , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  
    
end
