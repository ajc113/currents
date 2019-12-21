class AddDefaultValueToStateZoom < ActiveRecord::Migration[4.2]
  def change
    change_column :states, :zoom, :integer, default: '9'
  end
end
