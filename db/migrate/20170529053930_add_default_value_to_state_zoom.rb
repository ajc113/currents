class AddDefaultValueToStateZoom < ActiveRecord::Migration
  def change
    change_column :states, :zoom, :integer, default: '9'
  end
end
