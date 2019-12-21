class AddZoomToReports < ActiveRecord::Migration[4.2]
  def change
    add_column :states, :zoom, :integer
  end
end
