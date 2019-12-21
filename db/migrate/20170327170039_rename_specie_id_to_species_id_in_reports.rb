class RenameSpecieIdToSpeciesIdInReports < ActiveRecord::Migration[4.2]
  def change
    rename_column :reports, :specie_id, :species_id
  end
end
