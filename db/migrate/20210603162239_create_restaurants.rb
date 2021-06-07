class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.text :address, null: false
      t.text :opening_hours
      t.string :email, null: false, unique: true
      t.boolean :accept_reservation, default: true
      t.boolean :home_deliveries, default: true 
      t.integer :phone_number, null: false

      t.timestamps
    end
  end
end
