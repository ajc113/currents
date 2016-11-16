class CreateBuzzs < ActiveRecord::Migration
  def change
    create_table :buzzs do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :post

      t.timestamps null: false
    end
  end
end
