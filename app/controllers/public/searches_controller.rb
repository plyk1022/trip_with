class Public::SearchesController < ApplicationController
  
  def search
    @posts = Post.looks(params[:word])
    @word = params[:word]
  end
  
end
