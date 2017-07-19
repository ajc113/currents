class AddPaymentSourceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :payment_source, :string
  end
end
