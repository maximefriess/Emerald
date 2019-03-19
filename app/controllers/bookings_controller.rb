class BookingsController < ApplicationController
  def index
    @title = 'ANALYTICS'
    # @listing = Listing.find(params[:listing_id])
    @listings = Listing.all
    # @booking_calculations = BookingCalculations.new(listing: params[:listing], month: params[:month])
    if params[:listing_id]
      @bookings = @bookings.where(listing_id: params[:listing_id])
    else
      @bookings
    end
    if params[:month]
      @bookings = @bookings.where(month: params[:month])
    else
      @bookings = Booking.all
    end
    if params[:year]
      @bookings = @bookings.where(year: params[:year])
    else
      @bookings
    end
  end
end
