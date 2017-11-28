class DropBlogoUsers < ActiveRecord::Migration
  def up
    drop_table :blogo_users
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
