class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @posts = Post.where(status: 0).page(params[:page]).per(10)
  end
end
