class AddStateWatersReferenceToReports < ActiveRecord::Migration[4.2]
  def change
    add_column :reports, :state_waters, :string
    add_foreign_key :reports, :states, column: :state_waters, primary_key: :name
  end
end
