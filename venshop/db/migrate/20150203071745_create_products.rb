class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.timestamps null: false
      t.string :name
      t.string :image_url
      t.string :status
      t.string :description
      t.integer :amount
      t.string :currencycode
      t.string :formattedprice
    end
  end
end
