class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.integer :tank_location_id
      t.integer :user_id

      t.timestamps
    end
  end
end
