class Public::SearchesController < ApplicationController

  def search
    @word = params[:word]
    @range = params[:range]

    if @range == 'タイトル'
      @posts = Post.looks(@range, @word)
    else
      @posts = Post.joins(schedules: :spots).looks(@range, @word).distinct
    end
  end
  
  def search_prefecture
      @prefecture = Prefecture.find(params[:prefecture_id])
      @posts = @prefecture.posts
  end

end
