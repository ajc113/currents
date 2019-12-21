class AddNumberColumnToLocation < ActiveRecord::Migration[4.2]
  def change
    add_column :locations, :number, :integer
  end
end
