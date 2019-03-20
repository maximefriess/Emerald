class BookingCalculations
  def initialize(bookings)
    # bookings is an array
    @bookings = bookings
  end

  def revenue
    revenue = 0
    @bookings.each do |booking|
      if booking.revenue
        revenue += booking.revenue
      end
    end
    revenue = revenue.round / 1000
  end

  def bookings_count
    @bookings.length
  end

  def occupancy
    occupancy = 0
    @bookings.each do |booking|
      if booking.occupancy_ratio
        occupancy += booking.occupancy_ratio
      end
    end
    occupancy.round
  end

  def average_rate
    sum = 0
    counter = 0
    @bookings.each do |booking|
      if booking.average_night_rate
        sum += booking.average_night_rate
        counter += 1
      end
    end
    if counter = 0
      return 0
    else
      average = (sum / counter).round
    end
  end
end


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
