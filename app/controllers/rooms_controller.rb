class RoomsController < ApplicationController
  #before_action :set_room, only: [:index]
  def index
    rooms = Room.where(hotel_id: params[:hotel_id])
    render json: rooms
  end

  private
  
  #def set_room
  #  @room = Room.find(params[:id])
  #end

  def room_params
    params.require(:room).permit(:type, :guests_number)
  end
end
