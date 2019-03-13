class ListingsController < ApplicationController
  def index
    @title = 'MY HOMES'
    @listings = Listing.all
  end

  def show
    @title = 'MY PROPERTY'
    @listing = Listing.find(params[:id])
  end


end
