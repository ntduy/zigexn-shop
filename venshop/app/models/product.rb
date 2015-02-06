class Product < ActiveRecord::Base
	has_many :category_relationship, class_name: "ProductCategory", foreign_key: "product_id", dependent: :destroy
	has_many :categories, through: :category_relationship, source: :category

	has_many :cart_details
	has_many :carts, through: :cart_details

	validates :name, presence: true
	validates :image_url, presence: true
	validates :description, presence: true
	validates :price, presence: true

	def self.search(search)
		if search
			return where(['name like ? OR name like ? OR name like ?', "%#{search.upcase}%","%#{search.downcase}%", "%#{search.capitalize}%"])
		else
			self.all
		end
	end
end
