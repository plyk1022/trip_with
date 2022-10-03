class Prefecture < ApplicationRecord
  
  has_many :prefecture_relations, dependent: :destroy
  has_many :posts, through: :prefecture_relations
  
end
