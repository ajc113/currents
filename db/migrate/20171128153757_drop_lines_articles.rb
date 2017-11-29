class DropLinesArticles < ActiveRecord::Migration
  def up
    drop_table :lines_articles
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end

  
end
