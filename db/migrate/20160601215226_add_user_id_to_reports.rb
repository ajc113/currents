class AddUserIdToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :user, index: true, foreign_key: true
  end
end
