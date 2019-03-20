class Admin::PhotosController < Admin::BaseController
  def index
    @listing = Listing.find(params[:listing_id])
    @photos = Photo.where(listing_id: @listing.id)
    @photo = Photo.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @photo = Photo.new(photo_params)
    @photo.listing = @listing
    if @photo.save
      redirect_to admin_listing_photos_path(@listing)
    else
      render :index
    end
  end

  def destroy
    @listing = Listing.find(params[:listing_id])
    @photo = Photo.find(params[:id])
    if @photo.destroy
      redirect_to admin_listing_photos_path(@listing)
    else
      flash[:notice] = "Couldn't destroy photo!"
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:content, :content_cache)
  end
end
