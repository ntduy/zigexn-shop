class CartsController < ApplicationController
	before_action :logged_in_user, only: [:show]

	def show
		@cart = Cart.find(params[:id])
	end

	def new
		@items = []
		if cart_ss[:items].count >0
			cart_ss[:items].each do |item|
				@items << {product: Product.find(item[:product_id]),quantity: item[:quantity]}
			end
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
				if item[:quantity] < 0
					flash[:danger] = "quantity < 0. Failed"
					redirect_to new_cart_path
				else
					CartDetail.create!(cart_id: @cart.id, product_id: item[:product_id], quantity: item[:quantity])
				end
			end
			delete_cart_ss
			@cart.send_checkout_email(current_user)
			flash[:success] = "You will be recevie them soon! Check your mail to see cart's infomation"
			redirect_to root_path
		else
			flash[:danger] = "failed. Please complete your bill's infomation"
			redirect_to new_cart_path
		end
	end


	private
	def cart_params
		params.require(:cart).permit(:user_id, :status, :name, :email, :address, :phone)
	end
end
