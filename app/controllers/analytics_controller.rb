class AnalyticsController < ApplicationController
  def index
    @title = 'ANALYTICS'
    @listing = Listing.find(params[:listing_id])
    @analytics = Listing.analytics
  end

  def show
    @listing = Listing.find(params[:listing_id])
    @revenue = @listing.analytics.revenue
    @bookings = @listing.analytics.bookings
    @occupancy_ratio = @listing.analytics.occupancy_ratio
    @average_night_rate = @listing.analytics.average_night_rate
  end
end
