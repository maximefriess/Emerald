class Photo < ApplicationRecord
  belongs_to :listing
  mount_uploader :content, PhotoUploader
end
