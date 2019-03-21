class MessagesController < ApplicationController
  def index
    @title = 'INBOX'
    # this will change to ModelName.where(@user = current_user)
    @listings = Listing.all

    if params[:doc_type]
      @messages = Message.where(doc_type: params[:doc_type])
    else
      @messages = Message.all
    end
    if params[:listing_id]
      @messages = @messages.where(listing_id: params[:listing_id])
    else
      @messages
    end
  end

  def show
    @title = 'MESSAGE'
    @message = Message.find(params[:id])
  end
end
