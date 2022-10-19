class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end


  def guest_sign_in
    user = User.guest
    sign_in user
    flash[:notice] = 'ゲストユーザーでログインしました。'
    redirect_to user_path(user)
  end


  protected

  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user

    if @user.valid_password?(params[:user][:password]) && @user.is_deleted
      redirect_to new_user_registration_path
    end
  end
end
