class DropLinesAuthors < ActiveRecord::Migration
  def up
    drop_table :lines_authors
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end

end
