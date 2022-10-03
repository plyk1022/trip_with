class Spot < ApplicationRecord
  
  belongs_to :schedule
  has_one_attached :image
  
end
