class DropLinesAuthorables < ActiveRecord::Migration
  def up
    drop_table :lines_authorables
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end

end


