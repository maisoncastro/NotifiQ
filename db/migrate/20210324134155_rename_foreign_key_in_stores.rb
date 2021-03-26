class RenameForeignKeyInStores < ActiveRecord::Migration[6.0]
  def change
    rename_column :stores, :business_user_id, :user_id
  end
end
