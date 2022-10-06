class Admin::PostsController < ApplicationController
  def show
  end

  def edit
    @post = Post.find(params[:id])
  end
end
