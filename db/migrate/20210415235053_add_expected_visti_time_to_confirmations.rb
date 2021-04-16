class AddExpectedVistiTimeToConfirmations < ActiveRecord::Migration[6.0]
  def change
    add_column :confirmations, :expected_visit_time, :integer
  end
end
