class RemoveDateFromReports < ActiveRecord::Migration
  def change
    remove_column :reports, :date, :datetime
  end
end
