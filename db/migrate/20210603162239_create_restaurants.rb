class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.text :opening_hours
      t.string :email
      t.boolean :accept_reservation, default: true 
      t.boolean :home_deliveries, default: true 
      t.integer :phone_number

      t.timestamps
    end
  end
end
