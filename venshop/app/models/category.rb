class Category < ActiveRecord::Base
	has_many :product_relationship, class_name: "ProductCategory", foreign_key: "category_id", dependent: :destroy
	has_many :products, through: :product_relationship, source: :product
end
