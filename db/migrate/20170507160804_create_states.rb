class CreateStates < ActiveRecord::Migration
  def change
    create_table :states, primary_key: :name do |t|
      t.float :lat
      t.float :long
      t.boolean :visible, default: true

      t.timestamps null: false
    end
    change_column :states, :name, :string
  end
end
