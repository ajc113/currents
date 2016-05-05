class RemoveThatBinaryThingFromReports < ActiveRecord::Migration
  def change
    remove_column :reports, :picture, :binary
  end
end
