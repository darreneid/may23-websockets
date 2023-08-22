class ChatsChannel < ApplicationCable::Channel
  def subscribed
    # params can take in a room id
    @chat = Chat.find_by(tea: params[:teaName])
    stream_for @chat
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
