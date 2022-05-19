class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :description
      t.integer :rating
      t.string :location
      t.string :image

      t.timestamps
    end
  end
end
