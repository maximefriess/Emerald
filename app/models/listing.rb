class Listing < ApplicationRecord
  has_many :users, through: :user_listings
  has_many :photos, dependent: :destroy
  has_many :messages
  has_many :analytics
end
