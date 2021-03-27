class RenameForeignKeyInConfirmations < ActiveRecord::Migration[6.0]
  def change
    rename_column :confirmations, :customer_id, :user_id
  end
end
