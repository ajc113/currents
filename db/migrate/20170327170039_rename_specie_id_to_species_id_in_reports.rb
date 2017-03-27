class RenameSpecieIdToSpeciesIdInReports < ActiveRecord::Migration
  def change
    rename_column :reports, :specie_id, :species_id
  end
end
