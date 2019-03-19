class BookingsController < ApplicationController
  def index
    @title = 'ANALYTICS'
    @listing = Listing.find(params[:listing_id])
    # @booking_calculations = BookingCalculations.new(listing: params[:listing], month: params[:month])

  end

end
