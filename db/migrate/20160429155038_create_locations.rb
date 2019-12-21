class CreateLocations < ActiveRecord::Migration[4.2]
  def change
    create_table :locations do |t|
      t.string :short_name
      t.text :long_name

      t.timestamps null: false
    end
  end
end
