class Product < ActiveRecord::Base
	has_many :category_relationship, class_name: "ProductCategory", foreign_key: "product_id", dependent: :destroy
	has_many :categories, through: :category_relationship, source: :category
end
