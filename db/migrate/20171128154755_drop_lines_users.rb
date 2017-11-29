class DropLinesUsers < ActiveRecord::Migration

  def up
    drop_table :lines_users
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end

end
