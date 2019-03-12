class ListingsController < ApplicationController
  def index
    @listings = Listing.all
    @title = 'MY HOMES'
  end

  def show
    @listing = Listing.find(params[:id])
    @title = 'MY PROPERTY'
  end


end
