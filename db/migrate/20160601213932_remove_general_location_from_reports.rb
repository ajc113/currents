class RemoveGeneralLocationFromReports < ActiveRecord::Migration[4.2]
  def change
    remove_column :reports, :general_location, :string
  end
end
