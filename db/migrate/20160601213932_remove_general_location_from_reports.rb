class RemoveGeneralLocationFromReports < ActiveRecord::Migration
  def change
    remove_column :reports, :general_location, :string
  end
end
