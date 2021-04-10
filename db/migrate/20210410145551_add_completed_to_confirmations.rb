class AddCompletedToConfirmations < ActiveRecord::Migration[6.0]
  def change
    add_column :confirmations, :completed, :boolean
  end
end
