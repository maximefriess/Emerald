class Booking < ApplicationRecord
  MONTHS = [
    "janvier", "février", "mars", "avril", "mai", "juin",
    "juillet", "août", "septembre", "octobre", "novembre", "décembre"
  ]
  belongs_to :listing
end
