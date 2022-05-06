class AddGuestsNumberToRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :guests_number, :integer
  end
end
