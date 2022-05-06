class AddHotelRoomToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :hotel_room, null: false, foreign_key: true
  end
end
