class AddLatitudeToReport < ActiveRecord::Migration
  def change
    add_column :reports, :latitude, :float
  end
end
