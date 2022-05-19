class AddHotelToHotelRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :hotel_rooms, :hotel, null: false, foreign_key: true
  end
end
