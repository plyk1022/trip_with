class Post < ApplicationRecord

  with_options presence: true do
    validates :title, length: { maximum: 25 }
    validates :body, length: { maximum: 100 }
    validates :start_date
    validates :end_date
    validates :prefecture_relation_ids
  end
  
  

  belongs_to :user

  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules, allow_destroy: true

  has_many :prefecture_relations, dependent: :destroy
  has_many :prefectures, through: :prefecture_relations
  accepts_nested_attributes_for :prefecture_relations, allow_destroy: true

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :post_tag, dependent: :destroy
  has_many :tag, through: :post_tag

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
