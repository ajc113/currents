class AddImageToHotspot < ActiveRecord::Migration[4.2]
  def change
    add_column :hotspots, :image, :string
  end
end
