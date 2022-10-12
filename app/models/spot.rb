class Spot < ApplicationRecord

  validates :name, presence: true
  validates :comment, presence: true
  validates :arriving_time, presence: true
  validates :leaving_time, presence: true
  validate :time_check


  def time_check
    if arriving_time.present? && leaving_time.present?
      errors.add(:leaving_time, "は出発時間より遅い時間を入力してください") unless arriving_time < leaving_time
    end
  end

  belongs_to :schedule
  has_one_attached :spot_image

  def get_spot_image(width, height)
    unless spot_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      spot_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    spot_image.variant(resize_to_fill: [width, height]).processed
  end

end
