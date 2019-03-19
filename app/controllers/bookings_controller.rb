class BookingsController < ApplicationController
  before_action :create_objects
  def index
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

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def build_years
    (2017..(Date.today.year + 2)).to_a
  end

  def create_objects
    @years = build_years
    @months = Booking::MONTHS
    @listings = Listing.all
    @title = 'ANALYTICS'
  end
end
