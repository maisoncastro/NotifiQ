class CreateConfirmations < ActiveRecord::Migration[6.0]
  def change
    create_table :confirmations do |t|
      t.time :start_time
      t.time :end_time
      t.integer :position
      t.string :qrcode
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
