class Api::V1::RoomMessagesController < ApplicationController
  # before_action :authenticated
  def index
    @room_messages = RoomMessage.all
    render json: @room_messages
  end

  def create
    room_id = msg_params[:room_id]
    user_id = current_user.id
    text = msg_params[:message]
    room = Room.find(room_id)
    if text != ""
      room_message = RoomMessage.new(room_id: room_id, user_id: user_id, message: text)
      if room_message.save
        serialized_data = ActiveModelSerializers::Adapter::Json.new(RoomMessageSerializer.new(room_message)).serializable_hash
        ActionCable.server.broadcast('room_messages_channel', serialized_data)
        head :ok
      end
    end
  end

  private

  def msg_params
    params.require(:room_message).permit(:message, :room_id)
  end
end
