class DropBlogoTags < ActiveRecord::Migration
  def up
    drop_table :blogo_tags
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
