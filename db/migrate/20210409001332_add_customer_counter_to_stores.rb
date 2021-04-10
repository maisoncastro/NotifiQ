class AddCustomerCounterToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :customer_count, :integer
  end
end
