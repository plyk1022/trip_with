class Schedule < ApplicationRecord
  
  belongs_to :post
  has_many :spots, dependent: :destroy
  accepts_nested_attributes_for :spots
  
end
