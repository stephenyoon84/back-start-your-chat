class Api::V1::RoomsController < ApplicationController
  before_action :authenticated, except: :index
  def index
    @rooms = Room.all
    render json: @rooms
  end

  def show

  end

  def create
    if room_params[:title] != ''
      category_id = Category.find_by(name: room_params[:category]).id
      newRoom = Room.new(title: room_params[:title], category_id: category_id, user_id: current_user.id)
      if newRoom.save
        serialized_data = ActiveModelSerializers::Adapter::Json.new(RoomSerializer.new(newRoom)).serializable_hash
        ActionCable.server.broadcast('rooms_channel', serialized_data)
        head :ok
      end
    end
  end

  private

  def room_params
    params.require(:room).permit(:title, :category)
  end
end
