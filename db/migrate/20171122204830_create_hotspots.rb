class CreateHotspots < ActiveRecord::Migration
  def change
    create_table :hotspots do |t|
      t.string :name
      t.text :commentary

      t.timestamps null: false
    end
  end
end
