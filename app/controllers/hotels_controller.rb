class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[show destroy]
  before_action :hotel_params, only: %i[create]
  before_action :rooms_params, only: %i[create]

  # GET /hotels
  def index
    hotels = Hotel.all
    render json: hotels
  end

  # GET /hotels/id
  def show
    render json: Hotel.includes(hotel_rooms: [:room]).find(@hotel.id)
      .as_json(include: { hotel_rooms: { include: :room } })
  end

  # POST /hotels
  def create
    hotel = @current_user.hotels.new(hotel_params)

    rooms = params[:rooms]
    rooms.each do |room|
      if Room.find(room['id'])
        hotel.hotel_rooms.new(room_id: room['id'], image: room['image'],
                              price: room['price'])
      end
    end

    if hotel.save
      render json: hotel, status: :created, location: hotel
    else
      render json: hotel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotels/1
  def destroy
    @hotel.destroy
    render json: 'Hotel deleted successfully'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def hotel_params
    params.permit(:name, :description, :rating, :image, :location)
  end

  def rooms_params
    params.permit(rooms: [])
  end
end
