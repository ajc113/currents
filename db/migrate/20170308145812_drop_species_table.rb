class DropSpeciesTable < ActiveRecord::Migration


  def up
    drop_table :species
  end


end