class AddDemographicToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :demographic, :text
  end
end
