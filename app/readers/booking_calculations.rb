class BookingCalculations
  def initialize(listing, year, month)
    @listing = listing
    @year = year
    @month = month
  end

  def get_all_listings
    bookings = Booking.all
    all_listings = bookings.map do |booking|
      booking.listing.name
    end
    all_listings
  end

  def total_revenue_by_listing
    listing_id = Listing.where(name: @listing)
    bookings_by_listing = Booking.where({
      listing_id: listing_id,
      month: month,
      year: year
      })
    revenue = 0
    bookings_by_listing.each do |booking|
      revenue += booking.revenue
    end
    return revenue
  end

  def total_revenue_by_user
    bookings_by_user = Booking.where({
      listing_id: @listing_id,
      month: month,
      year: year
    })
    revenue = 0
    bookings_by_user.each do |booking|
      revenue += booking.revenue
    end
    return revenue
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
