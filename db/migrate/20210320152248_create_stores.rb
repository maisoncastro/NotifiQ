class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :capacity
      t.string :store_qrcode
      t.float :longitude
      t.float :latitude
      t.references :business_user, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
