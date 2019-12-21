class DeleteTargetSpeciesColumnFromReports < ActiveRecord::Migration[4.2]
  def change
    remove_column :reports, :target_species
  end
end
