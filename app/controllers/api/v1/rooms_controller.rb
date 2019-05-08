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
      newRoom = Room.find_or_create_by(title: room_params[:title], category_id: category_id, user_id: current_user.id)
      json = newRoom
    else
      json = {errors: "something went wrong.", success: false}
    end
    render json: json
  end

  private

  def room_params
    params.require(:room).permit(:title, :category)
  end
end
