class Api::V1::RoomMessagesController < ApplicationController
  before_action :authenticated
  def index
    @room_messages = RoomMessage.all
    render json: @room_messages
  end

  def create
    room_id = msg_params[:room_id]
    user_id = current_user.id
    text = msg_params[:message]
    if text != ""
      room_message = RoomMessage.create(room_id: room_id, user_id: user_id, message: text)
      json = room_message
    else
      json = {errors: "something went wrong.", success: false}
    end
    render json: json
  end

  private

  def msg_params
    params.require(:room_message).permit(:message, :room_id)
  end
end
