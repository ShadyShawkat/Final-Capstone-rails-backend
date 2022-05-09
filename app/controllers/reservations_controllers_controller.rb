class ReservationsControllersController < ApplicationController
  before_action :set_reservations, only: %i[ show create destroy ]

  # GET /reservations
  def index
    @reservations = Reservation.where(user_id => current_user.id)

    render json: @reservations
  end

  # POST /reservations
  def create
    @reservations = Reservation.new(reservations_params)

    if @reservations.save
      render json: @reservations, status: :created, location: @reservations
    else
      render json: @reservations.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservations.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservations
      @reservations = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservations_params
      params.fetch(:reservations, {})
    end
end
