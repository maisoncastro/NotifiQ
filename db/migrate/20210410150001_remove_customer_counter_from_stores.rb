class RemoveCustomerCounterFromStores < ActiveRecord::Migration[6.0]
  def change
    remove_column :stores, :customer_count
  end
end
