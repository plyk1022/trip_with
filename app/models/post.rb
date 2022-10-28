class Post < ApplicationRecord

  # 投稿
  with_options presence: true, on: :published do
    validates :title, length: { maximum: 30 }
    validates :body, length: { maximum: 200 }
    validates :start_date
    validates :end_date
    validates :prefecture_ids
  end

  #下書き
  validates :title, presence: true, length: { maximum: 30 }

  belongs_to :user

  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules, allow_destroy: true

  has_many :prefecture_relations, dependent: :destroy
  has_many :prefectures, through: :prefecture_relations
  accepts_nested_attributes_for :prefecture_relations, allow_destroy: true

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(range, word)
    if range == 'タイトル'
      where(["title like?", "%#{word}%"])
    else
      where(["name like?", "%#{word}%"])
    end
  end

end
