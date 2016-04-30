class AddLongitudeToReport < ActiveRecord::Migration
  def change
    add_column :reports, :longitude, :float
  end
end
