class CreateHotelRoom < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_rooms do |t|
      t.string :image
      t.integer :price

      t.timestamps
    end
  end
end
