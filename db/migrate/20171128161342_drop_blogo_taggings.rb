class DropBlogoTaggings < ActiveRecord::Migration
  def up
    drop_table :blogo_taggings
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
