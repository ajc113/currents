class DeleteTargetSpeciesColumnFromReports < ActiveRecord::Migration
  def change
    remove_column :reports, :target_species
  end
end
