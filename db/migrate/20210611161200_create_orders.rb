class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :restaurant, foreign_key: true
      t.references :dish, foeign_key: true
      t.decimal :sum
      t.integer :quantity, default: 1
      t.string :payment_method
      

      t.timestamps
    end
  end
end
