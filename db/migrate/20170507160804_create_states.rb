class CreateStates < ActiveRecord::Migration
  def change
    create_table :states, id: false do |t|
      t.string :name, null: false
      t.float :lat
      t.float :lng
      t.boolean :visible, default: true

      t.timestamps null: false
    end
    add_index :states, :name, unique: true
  end
end
