class ChangeCatchKeepersToFloatInReports < ActiveRecord::Migration
  def change
    change_column :reports, :catch_keepers, :float
  end
end
