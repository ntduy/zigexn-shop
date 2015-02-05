class CartDetailsController < ApplicationController
  before_action :set_cart_detail, only: [:show, :edit, :update, :destroy]

  # GET /cart_details
  # GET /cart_details.json
  def index
    @cart_details = CartDetail.all
  end

  # GET /cart_details/1
  # GET /cart_details/1.json
  def show
  end

  # GET /cart_details/new
  def new
    @cart_detail = CartDetail.new
  end

  # GET /cart_details/1/edit
  def edit
  end

  # POST /cart_details
  # POST /cart_details.json
  def create
    @cart_detail = CartDetail.new(cart_detail_params)

    respond_to do |format|
      if @cart_detail.save
        format.html { redirect_to @cart_detail, notice: 'Cart detail was successfully created.' }
        format.json { render :show, status: :created, location: @cart_detail }
      else
        format.html { render :new }
        format.json { render json: @cart_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_details/1
  # PATCH/PUT /cart_details/1.json
  def update
    respond_to do |format|
      if @cart_detail.update(cart_detail_params)
        format.html { redirect_to @cart_detail, notice: 'Cart detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_detail }
      else
        format.html { render :edit }
        format.json { render json: @cart_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_details/1
  # DELETE /cart_details/1.json
  def destroy
    @cart_detail.destroy
    respond_to do |format|
      format.html { redirect_to cart_details_url, notice: 'Cart detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_detail
      @cart_detail = CartDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_detail_params
      params.require(:cart_detail).permit(:cart_id, :product_id, :quantity)
    end
end
