class AddPaymentSourceToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :payment_source, :string
  end
end
