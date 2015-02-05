class Product < ActiveRecord::Base
	has_many :category_relationship, class_name: "ProductCategory", foreign_key: "product_id", dependent: :destroy
	has_many :categories, through: :category_relationship, source: :category

	has_many :cart_details
	def self.search(search)
		if search
			return where(['name like ? OR name like ? OR name like ?', "%#{search.upcase}%","%#{search.downcase}%", "%#{search.capitalize}%"])
		else
			self.all
		end
	end
end
