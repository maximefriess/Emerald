class Message < ApplicationRecord
  belongs_to :listing
  mount_uploader :attachment, DocumentUploader
  validates :title, :content, :doc_type, presence: true
end
