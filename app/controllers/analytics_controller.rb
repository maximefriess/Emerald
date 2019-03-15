class AnalyticsController < ApplicationController
  def index
    @title = 'ANALYTICS'
    @listing = Listing.find(params[:listing_id])

  end

end
