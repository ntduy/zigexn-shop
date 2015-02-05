class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.string :status
      t.string :name
      t.string :email
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
