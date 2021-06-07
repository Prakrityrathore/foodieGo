class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.references :restaurant, foreign_key: true
      t.string :name, null: false
      t.string :cuisine
      t.decimal :price, precision: 5, scale: 2, null: false
      t.float :ratings, null: false
      t.text :description

      t.timestamps
    end
  end
end
