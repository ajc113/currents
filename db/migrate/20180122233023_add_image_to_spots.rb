class AddImageToSpots < ActiveRecord::Migration[4.2]
  def change
    add_column :spots, :image, :string
  end
end
