class CreateCartDetails < ActiveRecord::Migration
  def change
    create_table :cart_details do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :product, index: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
