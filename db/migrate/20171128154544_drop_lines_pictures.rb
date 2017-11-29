class DropLinesPictures < ActiveRecord::Migration
  def up
    drop_table :lines_pictures
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end

end
