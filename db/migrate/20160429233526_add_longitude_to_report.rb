class AddLongitudeToReport < ActiveRecord::Migration[4.2]
  def change
    add_column :reports, :longitude, :float
  end
end
