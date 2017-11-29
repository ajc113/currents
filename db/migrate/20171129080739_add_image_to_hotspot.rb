class AddImageToHotspot < ActiveRecord::Migration
  def change
    add_column :hotspots, :image, :string
  end
end
