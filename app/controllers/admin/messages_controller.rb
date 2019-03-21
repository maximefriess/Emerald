class Admin::MessagesController < Admin::BaseController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @display_names = display_names
  end

  def create
    @listings = Listing.all
    @message = Message.new(message_params)
    @display_names = display_names
    @message.listing_id = @listings.find_by(display_name: message_params[:listing_id]).id
    if @message.save
      redirect_to admin_messages_path
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      redirect_to admin_messages_path
    else
      flash[:notice] = "Couldn't destroy message!"
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :doc_type, :attachment, :listing_id)
  end

  def display_names
    listing_names = []
    Listing.all.each do |listing|
      listing_names << listing.display_name
    end
    listing_names
  end
end
