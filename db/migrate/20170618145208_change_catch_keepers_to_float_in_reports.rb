class ChangeCatchKeepersToFloatInReports < ActiveRecord::Migration[4.2]
  def change
    change_column :reports, :catch_keepers, :float
  end
end
