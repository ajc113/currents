class AddYoutubeIdToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :youtube_id, :text
  end
end
