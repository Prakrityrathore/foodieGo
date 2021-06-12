class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.references :order, foreign_key: true
      t.string :name, null: false
      t.integer :phone_number, null: false
      t.string :delivery_address, null: false
      t.string :payment_method


      t.timestamps
    end
  end
end
