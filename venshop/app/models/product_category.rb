class ProductCategory < ActiveRecord::Base
	belongs_to :product, class_name: "Product"
	belongs_to :category, class_name: "Category"
	validates :product_id, presence: true
	validates :category_id, presence: true
end
