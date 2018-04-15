class CreateTankLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :tank_locations do |t|
      t.integer :user_id
      t.float :longitude
      t.float :latitude
      t.string :address

      t.timestamps
    end
  end
end
