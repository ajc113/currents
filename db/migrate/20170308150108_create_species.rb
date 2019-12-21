class CreateSpecies < ActiveRecord::Migration[4.2]
  def change
    create_table :species do |t|
      t.string :primary_species
      t.string :state_waters
      t.string :located

      t.timestamps null: false
    end
  end

  def down
  	drop_table :species
  end
end
