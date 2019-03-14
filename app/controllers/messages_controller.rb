class MessagesController < ApplicationController
  def index
    @title = 'INBOX'
    @messages = Message.all

  end

  def show
    @message = Message.find(params[:id])
    @title = @message.title
  end
end
