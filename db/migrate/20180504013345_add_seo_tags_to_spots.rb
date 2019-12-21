class AddSeoTagsToSpots < ActiveRecord::Migration[4.2]
  def change
    add_column :spots, :meta_title, :text
    add_column :spots, :meta_description, :text
    add_column :spots, :meta_keywords, :text
  end
end
