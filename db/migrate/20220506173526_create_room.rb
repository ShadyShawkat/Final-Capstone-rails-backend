class CreateRoom < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :type

      t.timestamps
    end
  end
end
