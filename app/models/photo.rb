class Photo < ApplicationRecord
  belongs_to :listing
  has_many :stories
end
