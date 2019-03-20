class Listing < ApplicationRecord
  has_many :users, through: :user_listings
  has_many :user_listings, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
