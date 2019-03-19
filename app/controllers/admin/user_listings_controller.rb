class Admin::UserListingsController < Admin::BaseController
  def index
    @user = User.find(params[:user_id])
    @listings = all_listings.map { |x| x.values }
    @user_listing = UserListing.new
    @user_listings = UserListing.where(user_id: @user.id)
  end

  def create
    @user = User.find(params[:user_id])
    @user_listing = UserListing.new(user_listing_params)
    @user_listing.user_id = @user.id
    if @user_listing.save
      redirect_to admin_user_user_listings_path(@user)
    else
      render :index
    end
  end

  def destroy
    @user_listing = UserListing.find(params[])
  end

  private

  def user_listing_params
    params.require(:user_listing).permit(:listing_id)
  end

  def all_listings
    all_listings = []
    Listing.all.each do |listing|
      all_listings << {
        name: listing.name,
        id: listing.id
      }
    end
    all_listings
  end
end
