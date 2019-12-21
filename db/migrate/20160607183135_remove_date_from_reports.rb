class RemoveDateFromReports < ActiveRecord::Migration[4.2]
  def change
    remove_column :reports, :date, :datetime
  end
end
