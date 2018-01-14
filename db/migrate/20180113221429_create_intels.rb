class CreateIntels < ActiveRecord::Migration
  def change
    create_table :intels do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
