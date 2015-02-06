class Cart < ActiveRecord::Base
	has_many :cart_details
	has_many :products, through: :cart_details
	validates :name, presence: true
	validates :address, presence: true
	validates :phone, presence: true
	validates :email, presence: true
end
