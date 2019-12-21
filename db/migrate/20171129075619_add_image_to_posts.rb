class AddImageToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :image, :string
  end
end
