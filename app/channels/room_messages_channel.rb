class RoomMessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # room = Room.find(params[:room])
    # stream_for room
    stream_from 'room_messages_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
