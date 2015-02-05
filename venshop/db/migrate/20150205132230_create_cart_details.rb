class CreateCartDetails < ActiveRecord::Migration
  def change
    create_table :cart_details do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
