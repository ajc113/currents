class AddCoordinateJsonFileToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :coordinate_file, :string
  end
end
