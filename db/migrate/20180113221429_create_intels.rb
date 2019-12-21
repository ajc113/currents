class CreateIntels < ActiveRecord::Migration[4.2]
  def change
    create_table :intels do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
