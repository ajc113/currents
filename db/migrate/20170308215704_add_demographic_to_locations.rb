class AddDemographicToLocations < ActiveRecord::Migration[4.2]
  def change
    add_column :locations, :demographic, :text
  end
end
