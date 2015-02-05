class CategoriesController < ApplicationController
	before_action :admin_user, only: [:destroy, :edit, :update, :create]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def show
		@category = Category.find_by(name: params[:name])
		@products = @category.products.paginate(page: params[:page]).per_page(12)
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "category created"
			redirect_to categories_url
		else
			flash[:danger] = "failed"
			render 'new'
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			redirect_to categories_url
		else
			render 'edit'
		end
	end

	def destroy
		if !ProductCategory.find_by(category_id: params[:id]).nil?
			ProductCategory.find_by(category_id: params[:id]).destroy
		end
		Category.find(params[:id]).destroy
		flash[:success] = "category deleted"
		 redirect_to categories_url
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end
end
