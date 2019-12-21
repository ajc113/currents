class AddSpecieToReports < ActiveRecord::Migration[4.2]
  def up
    add_column :reports, :specie_id, :integer
  end

  def down
  	remove_column :reports, :specie_id
  end
end
