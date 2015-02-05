class HomesController < ApplicationController
	def index
		@products = Product.paginate(page: params[:page]).per_page(12)
	end
end
