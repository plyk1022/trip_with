class Public::SearchesController < ApplicationController

  def search
    @prefectures = Prefecture.all
    @word = params[:word]
    @range = params[:range]

    if @range == 'タイトル'
      @posts = Post.looks(@range, @word).where(status: 0)
      @posts = Kaminari.paginate_array(@posts).page(params[:page])
    else
      @posts = Post.joins(schedules: :spots).looks(@range, @word).where(status: 0).distinct
      @posts = Kaminari.paginate_array(@posts).page(params[:page])
    end
  end
  
  def search_prefecture
    @prefectures = Prefecture.all
    @prefecture = Prefecture.find(params[:prefecture_id])
    
    @posts = @prefecture.posts.where(status: 0)
    @posts = Kaminari.paginate_array(@posts).page(params[:page])
  end

end
