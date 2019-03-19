class BookingCalculations
  def initialize
  end

  def revenue_month(bookings, month, year)
    # bookings is an array for example listing.bookings
    revenue = 0
    bookings.each do |booking|
      if booking.revenue && booking.month == month && booking.year == year
        revenue += booking.revenue
      end
    end
    revenue
  end

  def revenue_year(bookings, year)
    # bookings is an array for example listing.bookings
    revenue = 0
    bookings.each do |booking|
      if booking.revenue && booking.year == year
        revenue += booking.revenue
      end
    end
    revenue
  end

  def bookings_month(bookings, month, year)
    counter = 0
    bookings.each do |booking|
      if booking.month == month && booking.year == year
        counter += 1
      end
    end
    counter
  end

  def bookings_year(bookings, year)
    counter = 0
    bookings.each do |booking|
      if booking.year == year
        counter += 1
      end
    end
    counter
  end
end

Bo



# MORE EFFICIENT WAY
# class BookingCalculations
#   def initialize(listing, year, month)
#     @listing_id = Listing.where(name: listing)
#     @bookings_array = Booking.where({
#         listing_id: @listing_id,
#         month: month,
#         year: year
#       })
#   end

#   def total_revenue
# => THIS AVOIDS RECALCULATING @REVENUE EVERY TIME IT IS CALLED
#     @revenue ||= set_total_revnue
#   end

#   def set_total_revnue
#     revenue = 0
#     @bookings_array.each do |booking|
#       revenue += booking.revenue
#     end
#     revenue
#   end
# end
