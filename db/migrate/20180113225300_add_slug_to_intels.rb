class AddSlugToIntels < ActiveRecord::Migration
  def change
    add_column :intels, :slug, :string
  end
end
