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
  validate :confirm_password_is_same_password
  # def listings
  #   user_listings.map do |ul|
  #     ul.listing
  #   end
  # end

  def password_confirmation=(conf)
    @password_confirmation= conf
  end

  def confirm_password_is_same_password
    if @confirmation_password != password
      self.errors.add(:password_confirmation, "Must be the same")
    end
  end

end
