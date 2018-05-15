class AddNeighborhoodToTankLocation < ActiveRecord::Migration[5.1]
  def change
  	change_table :tank_locations do |t|
        t.string :neighborhood 
    end
  end
end
