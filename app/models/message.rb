class Message < ApplicationRecord
  belongs_to :listing
  mount_uploader :attachment, PhotoUploader
end
