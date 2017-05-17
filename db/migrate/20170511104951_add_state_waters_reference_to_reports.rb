class AddStateWatersReferenceToReports < ActiveRecord::Migration
  def change
    add_column :reports, :state_waters, :string
    add_foreign_key :reports, :states, column: :state_waters, primary_key: :name
  end
end
