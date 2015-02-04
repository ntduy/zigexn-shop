class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.timestamps null: false
      t.string :name
      t.string :image_url
      t.string :description
      t.float :price
    end
  end
end
