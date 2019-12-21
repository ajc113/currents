class AddSeoTagsToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :meta_title, :text
    add_column :posts, :meta_description, :text
    add_column :posts, :meta_keywords, :text
  end
end
