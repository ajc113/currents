class AddCoordinateJsonFileToLocations < ActiveRecord::Migration[4.2]
  def change
    add_column :locations, :coordinate_file, :string
  end
end
