class DropBuzzs < ActiveRecord::Migration
  def change
  	drop_table :buzzs
  end
end
