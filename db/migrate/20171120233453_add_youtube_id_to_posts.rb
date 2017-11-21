class AddYoutubeIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :youtube_id, :text
  end
end
