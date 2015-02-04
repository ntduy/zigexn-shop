class ProductsController < ApplicationController
	before_action :admin_user, only: [:destroy, :edit, :update, :create]
	def index
		@products = Product.paginate(page: params[:page]).per_page(10)
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
		@categories = Category.all
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			params[:categories][:name].each do |category_id|
				ProductCategory.create!(product_id: @product.id, category_id: category_id)
			end
			flash[:info] = "Product created successfully."
			render 'show'
		else
			render 'new'
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(user_params)
			render 'show'
		else
			render 'edit'
		end
	end

	def destroy
		if !ProductCategory.find_by(product_id: params[:id]).nil?
			ProductCategory.find_by(product_id: params[:id]).destroy
		end
		Product.find(params[:id]).destroy
		flash[:success] = "product deleted"
		 redirect_to products_url
	end

	private
	def product_params
		params.require(:product).permit(:name, :image_url, :description, :price)
	end
end
