class DropBlogoPosts < ActiveRecord::Migration
  def up
    drop_table :blogo_posts
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
