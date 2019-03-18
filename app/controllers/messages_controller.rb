class MessagesController < ApplicationController
  def index
    @title = 'INBOX'
    @messages = Message.all
    @listings = Listing.all
  end

  def show
    @title =  'MESSAGE'
    @message = Message.find(params[:id])
  end
end
