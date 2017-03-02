class AddStateWatersToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :state_waters, :text
  end
end
