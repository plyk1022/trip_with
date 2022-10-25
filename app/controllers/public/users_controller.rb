class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only: [:edit]
  before_action :ensure_guest_user, only: [:edit]

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: 'DESC')
    @search = params[:search]

    unless current_user == @user
      @posts = @posts.where(status: 0)
    end

    if @search == '公開中の投稿'
      @posts = @posts.where(status: 0)
    elsif @search == '下書き'
      @posts = @posts.where(status: 1)
    end

    @posts = Kaminari.paginate_array(@posts).page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'ユーザー情報を編集しました'
      redirect_to user_path(@user)
    else
      flash.now[:alert] = '入力内容を確認してください'
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_current_user
    @user = User.find(params[:id])
    redirect_to posts_path  unless @user == current_user
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == 'ゲストユーザー'
      redirect_to posts_path
      flash[:alert] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
