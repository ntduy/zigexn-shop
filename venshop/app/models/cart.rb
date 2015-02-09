class Cart < ActiveRecord::Base
	has_many :cart_details
	has_many :products, through: :cart_details
	validates :name, presence: true
	validates :address, presence: true
	validates :phone, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.+\d]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	format: { with: VALID_EMAIL_REGEX }

	VALID_PHONE_REGEX = /[0]{1}[0-9]{9,10}/i
	validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
	
	def send_checkout_email(user)
		UserMailer.checkout_cart(user,self).deliver_now
	end
end
