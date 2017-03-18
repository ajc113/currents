class AddNumberColumnToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :number, :integer
  end
end
