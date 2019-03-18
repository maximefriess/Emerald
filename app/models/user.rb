class User < ApplicationRecord
  has_many :user_listings
  has_many :listings, through: :user_listings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader
  validates_format_of :first_name, :last_name, with: /\A[a-z]+\z/i
  validates :phone_number, :length => { :minimum => 5, :maximum => 14 }, :format => { with: /[0-9]+/ }
  validates :password, confirmation: { case_sensitive: true }
end
