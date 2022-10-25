class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: { maximum: 15 }, uniqueness: true
  validates :introduction, length: { maximum: 100 }  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 

  has_many :posts, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image_profile.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'no-image_profile.jpeg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_fill: [width, height]).processed
  end

  def self.guest
    find_or_create_by!(name: 'ゲストユーザー' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲストユーザー'
    end
  end

end
