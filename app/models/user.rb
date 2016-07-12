class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :shops, through: :reviews
  has_many :shops

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :encrypted_password, presence: true
  mount_uploader :profile_photo, ProfilePhotoUploader
end
