class ReservationsController < ApplicationController
  before_action :set_reservations, only: %i[destroy]
  before_action :reservations_params, only: %i[create]

  # GET /reservations
  def index
    reservations = Reservation.where(user_id: @current_user.id)
    render json: reservations
  end

  # POST /reservations
  def create
    @reservations = @current_user.reservations.new(reservations_params)
    if @reservations.save
      render json: @reservations, status: :created, location: @reservations
    else
      render json: @reservations.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
    render json: 'Reservation deleted successfully', status: 200
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservations
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservations_params
    params.permit(:date, :hotel_room_id)
  end
end
