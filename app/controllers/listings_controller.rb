class ListingsController < ApplicationController
  def index
    @title = 'MY HOMES'
    # @listings = current_user.listings
    # to be implimented when we have real users and lisitngs
    @listings = Listing.all
  end

  def show
    @title = 'MY PROPERTY'
    @listing = Listing.find(params[:id])
    @bookings = Booking.where(listing_id: @listing.id)
  end
end
