class Batch::DataReset
  def self.data_reset
    user = User.find_by(email: 'guest@example.com')
    user.posts.destroy_all
    user.comments.destroy_all
    p "投稿を全て削除しました"
  end
end