class RenamePrimarySpeciesColumnInSpecies < ActiveRecord::Migration[4.2]
  def change
    rename_column :species, :primary_species, :name
  end
end
