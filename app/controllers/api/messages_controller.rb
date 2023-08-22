class Api::MessagesController < ApplicationController
  def index
    @chat = Chat.find_by(tea: params[:tea])
    render json: @chat.messages
  end

  def create
    @chat = Chat.find_by(tea: params[:tea])
    @message = Message.new(message_params)
    @message.chat_id = @chat.id

    if @message.save
      ChatsChannel.broadcast_to(@chat, { type: 'RECEIVE_MESSAGE', message: @message })
      render json: @message
    else
      render json: { errors: @message.errors.full_messages }, status: 422
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
