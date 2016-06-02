class AddUserAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :home_port, :string
    add_column :users, :state, :string
    add_column :users, :vessel_name, :string
  end
end
