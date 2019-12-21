class AddLatitudeToReport < ActiveRecord::Migration[4.2]
  def change
    add_column :reports, :latitude, :float
  end
end
