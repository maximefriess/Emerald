class Photo < ApplicationRecord
  belongs_to :listing
  has_many :stories
  mount_uploader :content, PhotoUploader
end
