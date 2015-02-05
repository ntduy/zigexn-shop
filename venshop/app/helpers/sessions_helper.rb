module SessionsHelper
	
		# if logged_in?
		# 		session[:cart][:user_id] = current_user.id
		# 	else
		# 		session[:cart][:user_id] = 0
		# 	end

	def create_cart
		if session[:cart].nil?
			session[:cart] = {}
			session[:cart][:items] = Array.new	
		else
			session[:cart].deep_symbolize_keys!
		end
	end

	def product_in_cart?(product_id)
		session[:cart][:items].each do |item|
			if item[:product_id] == product_id
				return item
			end
		end
		nil
	end

	def add_to_cart(product_id)
		create_cart
		if product_in_cart?(product_id)
			product_in_cart?(product_id)[:quantity] += 1
		else
			session[:cart][:items] << {product_id: product_id, quantity: 1 }
		end
	end

	def log_in(user)
		session[:user_id] = user.id
		create_cart
		session[:cart][:user_id] = current_user.id
	end

	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	def current_user
		if (user_id = session[:user_id])
			@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
			user = User.find_by(id: user_id)
			if user && user.authenticated?(:remember, cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	def store_location
		session[:forwarding_url] = request.url if request.get?
	end
end
