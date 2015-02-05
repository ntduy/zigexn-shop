class CartsController < ApplicationController
	before_action :logged_in_user, only: [:index, :show]
	def index
		@carts = Cart.all
	end

	def show

	end

	def new
		@items = []
		cart_ss[:items].each do |item|
			@items << {product: Product.find(item[:product_id]),quantity: item[:quantity]}
		end

		@cart = Cart.new
		if logged_in?
			@cart.user_id = current_user.id
			@cart.name    = current_user.name
			@cart.email   = current_user.email
			@cart.address = current_user.address
			@cart.phone   = current_user.phone
		else
			@cart.user_id = 0
		end
	end

	def create
		@cart = Cart.new(cart_params)
		@cart.status = "being shipped"
		if logged_in?
			@cart.user_id = current_user.id
		else
			@cart.user_id = 0
		end
		if @cart.save
			cart_ss[:items].each do |item|
				CartDetail.create!(cart_id: @cart.id, product_id: item[:product_id], quantity: item[:quantity])
			end
			delete_cart_ss
			flash[:success] = "You will be recevie them soon!"
			redirect_to root_path
		else
			flash[:danger] = "failed"
			render 'new'
		end
	end


	private
	def cart_params
		params.require(:cart).permit(:user_id, :status, :name, :email, :address, :phone)
	end
end
