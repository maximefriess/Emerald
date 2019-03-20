class Booking < ApplicationRecord
  MONTHS = {
    "janvier" => "January",
    "février" => "February",
    "mars" => "March",
    "avril" => "April",
    "mai" => "May",
    "juin" => "June",
    "juillet" => "July",
    "août" => "August",
    "septembre" => "September",
    "octobre" => "October",
    "novembre" => "November",
    "décembre" => "December"
  }
  belongs_to :listing
end
