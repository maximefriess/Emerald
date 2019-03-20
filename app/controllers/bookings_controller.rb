class BookingsController < ApplicationController
  before_action :create_objects
  def index
    @listings = Listing.all
    if params[:listing_id]
      @bookings = Booking.where(listing_id: params[:listing_id])
    else
      @bookings = Booking.all
    end
    if params[:month]
      @bookings = @bookings.where(month: params[:month])
    else
      @bookings
    end
    if params[:year]
      @bookings = @bookings.where(year: params[:year])
    else
      @bookings
    end
  end

  private

  def build_years
    (2017..(Date.today.year + 2)).to_a
  end

  def create_objects
    @years = build_years
    @months = Booking::MONTHS
    @title = 'ANALYTICS'
  end
end
