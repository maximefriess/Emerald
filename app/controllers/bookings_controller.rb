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
    @years = build_years
    @months = Booking::MONTHS
  end

  def show
    @listings = Listing.where(@user == current_user)
    @booking = Booking.find(params[:id])
  end

  private

  def build_years
    (2017..(Date.today.year + 2)).to_a
  end
end
