class Post < ApplicationRecord
  
  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules
  
  has_many :prefecture_relations, dependent: :destroy
  has_many :prefectures, through: :prefecture_relations
  accepts_nested_attributes_for :prefecture_relations
end
