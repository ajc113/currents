class AddSlugToIntels < ActiveRecord::Migration[4.2]
  def change
    add_column :intels, :slug, :string
  end
end
