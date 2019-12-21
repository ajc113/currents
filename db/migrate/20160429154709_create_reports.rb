class CreateReports < ActiveRecord::Migration[4.2]
  def change
    create_table :reports do |t|
      t.datetime :date
      t.string :target_species
      t.string :general_location
      t.integer :catch_keepers
      t.integer :catch_total
      t.text :trip_summary
      t.string :primary_method
      t.text :tide
      t.text :weather
      t.text :wind
      t.text :spot
      t.binary :picture
      t.text :best_bait
      t.text :trip_description

      t.timestamps null: false
    end
  end
end
