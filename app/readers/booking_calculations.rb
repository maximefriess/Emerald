class BookingCalculations
  def initialize(bookings)
    # bookings is an array
    @bookings = bookings
    @count = @bookings.count
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
    unique_months = @bookings.pluck(:month, :year).uniq.count
    unique_listings = @bookings.pluck(:listing_id).uniq.count
    @bookings.each do |booking|
      if booking.occupancy_ratio
        occupancy += booking.occupancy_ratio/unique_months/unique_listings
      end
    end

    occupancy.round
  end

  def average_rate
    sum = 0
    if @count > 0
      @bookings.each do |booking|
        if booking.average_night_rate
          sum += booking.average_night_rate
        end
      end
      average = (sum / @count).round
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
