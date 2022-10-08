class Public::SessionsController < Devise::SessionsController
  
  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

 

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: 'guestuserでログインしました。'
  end

end
