class Spot < ApplicationRecord

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
