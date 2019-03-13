class PhotosController < ApplicationController
  def index
    @title = "ADD STORIES"
    @listing = Listing.find(params[:listing_id])
    @photos = @listing.photos
  end

  def new
  end

  def create
  end

  def edit
    @listing = Listing.find(params[:listing_id])
    @photo = Photo.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:listing_id])
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    if @photo.save
      redirect_to listing_photos_path(@listing)
    else
      render :edit
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:story)
  end

end


