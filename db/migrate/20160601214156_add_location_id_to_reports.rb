class AddLocationIdToReports < ActiveRecord::Migration[4.2]
  def change
    add_reference :reports, :location, index: true, foreign_key: true
  end
end
