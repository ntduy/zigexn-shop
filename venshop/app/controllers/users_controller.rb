class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: [:index, :destroy]

	def index
		@users = User.paginate(page: params[:page]).per_page(5)
	end

	def show
		@user = User.find(params[:id])
		@carts = Cart.where(user_id: @user.id)
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			@user.send_activation_email
			flash[:info] = "Please check your email to activate your account."
			redirect_to root_url
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			render 'show'
		else
			render 'edit'
		end
	end

	def destroy
		if params[:id].to_i != current_user.id
			User.find(params[:id]).destroy
			flash[:success] = "User deleted"
			redirect_to users_url
		else
			flash[:danger] = "Can not delete yourself"
			redirect_to users_url
		end
	end

	private

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless @user.id == current_user.id
	end

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
