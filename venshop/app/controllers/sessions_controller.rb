class SessionsController < ApplicationController
	# session for user 
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			if user.activated?
				log_in user
				params[:session][:remember_me] == '1' ? remember(user) : forget(user)
				redirect_back_or root_url
			else
				message  = "Account not activated. "
				message += "Check your email for the activation link."
				flash[:warning] = message
				redirect_to root_url
			end
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end
	# end session for user

# ========================================

	# session for cart
	def addtocart
		add_to_cart(params[:product_id])
		flash[:success] = "Add product to cart successfully"
		redirect_to root_url
	end

	def removefromcart
		cart_ss[:items].delete(product_in_cart?(params[:product_id]))
		redirect_to new_cart_path
	end

	def updatecart
		redirect_to new_cart_path
	end

	# end session for cart
end
