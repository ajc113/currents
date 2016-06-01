class AddLocationIdToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :location, index: true, foreign_key: true
  end
end
