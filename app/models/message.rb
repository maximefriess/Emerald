class Message < ApplicationRecord
  belongs_to :listing, dependent: :destroy
end
