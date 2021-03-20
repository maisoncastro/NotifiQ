class CreateBusinessUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :business_users do |t|

      t.timestamps
    end
  end
end
