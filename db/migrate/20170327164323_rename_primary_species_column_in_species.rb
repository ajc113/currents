class RenamePrimarySpeciesColumnInSpecies < ActiveRecord::Migration
  def change
    rename_column :species, :primary_species, :name
  end
end
