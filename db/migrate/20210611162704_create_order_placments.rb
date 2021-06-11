class CreateOrderPlacments < ActiveRecord::Migration[6.1]
  def change
    create_table :order_placments do |t|
      t.references :order
      t.references :dish

      t.timestamps
    end
  end
end
