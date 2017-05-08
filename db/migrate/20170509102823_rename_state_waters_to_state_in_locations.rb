class RenameStateWatersToStateInLocations < ActiveRecord::Migration
  def change
    rename_column :locations, :state_waters, :state
  end
end
