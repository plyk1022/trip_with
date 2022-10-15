class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @posts = Post.find(favorites)
    @posts = Kaminari.paginate_array(@posts).page(params[:page])
  end

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save
    render 'replace_btn'
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
    render 'replace_btn'
  end

end
