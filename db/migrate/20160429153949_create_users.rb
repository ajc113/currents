class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :email
      t.text :home_port
      t.string :boat_name

      t.timestamps null: false
    end
  end
end
