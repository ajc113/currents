class CreateSpots < ActiveRecord::Migration[4.2]
  def change
    create_table :spots do |t|
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps null: false
    end
  end
end
