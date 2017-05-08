class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.boolean :visible, default: true

      t.timestamps null: false
    end
  end
end
