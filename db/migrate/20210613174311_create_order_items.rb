class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :dish, foreign_key: true
      t.integer :quantity, default: 1
      t.decimal :total_price, precision: 5, scale: 2, null: false
      t.string :payment_method, null: false

      t.timestamps
    end
  end
end
