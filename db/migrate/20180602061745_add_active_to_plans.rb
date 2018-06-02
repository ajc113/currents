class AddActiveToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :active, :boolean, default: false
  end
end
