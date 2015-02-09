class ProductsController < ApplicationController
	before_action :admin_user, only: [:destroy, :new, :edit, :update, :create]
	def index
		@products = Product.search(params[:search]).paginate(page: params[:page]).per_page(12)
	end

	def show
		@product = Product.find(params[:id])
	end

	def search
		@search_results = Product.search params[:search]
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
		@categories = Category.all
		@current_categories = @product.categories
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			if !ProductCategory.find_by(product_id: params[:id]).nil?
				ProductCategory.find_by(product_id: params[:id]).destroy
			end
			params[:categories][:name].each do |category_id|
				ProductCategory.create!(product_id: @product.id, category_id: category_id)
			end
			render 'show'
		else
			render 'edit'
		end
	end

	def destroy
		unless ProductCategory.where(product_id: params[:id]).nil?
			ProductCategory.where(product_id: params[:id]).each do |item| 
				item.destroy
			end
		end
		unless CartDetail.where(product_id: params[:id]).nil?
			CartDetail.where(product_id: params[:id]).each do |item| 
				item.destroy
			end
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
