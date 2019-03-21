require_relative '../../writers/csv_parser'
class Admin::ListingsController < Admin::BaseController
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
    @listings_array = CsvParser.new('db/raw_bookings_data.csv').all_listings.uniq
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to admin_listing_photos_path(@listing)
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
    @listings_array = CsvParser.new('db/raw_bookings_data.csv').all_listings.uniq
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to admin_listing_photos_path(@listing)
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    if @listing.destroy
      redirect_to admin_listings_path
    else
      flash[:notice] = "Couldn't destroy listing!"
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:display_name, :name, :location, :public_listing_url)
  end
end


