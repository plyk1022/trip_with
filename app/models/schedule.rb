class Schedule < ApplicationRecord

  validates :date, presence: true

  belongs_to :post
  has_many :spots, dependent: :destroy
  accepts_nested_attributes_for :spots, allow_destroy: true

end
