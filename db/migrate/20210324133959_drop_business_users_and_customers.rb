class DropBusinessUsersAndCustomers < ActiveRecord::Migration[6.0]
  def change
    drop_table :business_users, force: :cascade
    drop_table :customers, force: :cascade
  end
end
