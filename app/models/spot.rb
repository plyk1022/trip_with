class Spot < ApplicationRecord

  with_options presence: true, on: :published do
    validates :name, length: { maximum: 30 }
    validates :comment, length: { maximum: 200 }
    validates :arriving_time
    validates :leaving_time
  end

  validate :time_order_check, on: :published
  

  def time_order_check
    if arriving_time.present? && leaving_time.present?
      errors.add(:leaving_time, "は到着時間より遅い時間を入力してください") unless arriving_time <= leaving_time
    end
  end

  belongs_to :schedule
  has_one_attached :spot_image

  def get_spot_image(width, height)
    unless spot_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image_spot.png')
      spot_image.attach(io: File.open(file_path), filename: 'no-image_spot.png', content_type: 'image/jpeg')
    end
    spot_image.variant(resize_to_fill: [width, height]).processed
  end

end
