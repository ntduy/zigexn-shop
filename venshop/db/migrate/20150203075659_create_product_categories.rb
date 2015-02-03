class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
    	t.timestamps null: false
      t.integer :product_id
      t.integer :category_id
    end
  end
end
