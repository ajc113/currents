class RemoveThatBinaryThingFromReports < ActiveRecord::Migration[4.2]
  def change
    remove_column :reports, :picture, :binary
  end
end
