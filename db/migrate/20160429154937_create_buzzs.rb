class CreateBuzzs < ActiveRecord::Migration
  def change
    create_table :buzzs do |t|
      t.text :post

      t.timestamps null: false
    end
  end
end
