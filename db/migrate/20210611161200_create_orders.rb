class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :restaurant, foreign_key: true
      t.string :delivery_address, null: false
      t.integer :phone_number, null: false
      
      t.timestamps
    end
  end
end
