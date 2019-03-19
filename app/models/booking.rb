class Booking < ApplicationRecord
  MONTHS = ["janvier", "someothercrazymonth", "février", "mars", "mai", "juin", "juillet", "août", "septembre", "octobre", "décembre", "avril"]
  belongs_to :listing

end
