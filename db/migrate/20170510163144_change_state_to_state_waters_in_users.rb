class ChangeStateToStateWatersInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :state, :state_waters
    add_foreign_key :users, :states, column: :state_waters, primary_key: :name
  end
end
