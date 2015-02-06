class Cart < ActiveRecord::Base
	has_many :cartdetails
	has_many :products, through: :cartdetails
end
