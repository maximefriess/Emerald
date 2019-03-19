class Admin::ListingsController < Admin::BaseController
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
    @listings_array = all_listings.map { |x| x.values }
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to admin_listings_path
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
    @listings_array = all_listings.map { |x| x.values }
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to admin_listings_path
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

  def all_listings
    all_listings = []
    Listing.all.each do |listing|
      all_listings << {
        name: listing.display_name,
        id: listing.id
      }
    end
    all_listings
  end
end


