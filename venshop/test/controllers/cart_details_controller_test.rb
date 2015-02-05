require 'test_helper'

class CartDetailsControllerTest < ActionController::TestCase
  setup do
    @cart_detail = cart_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cart_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cart_detail" do
    assert_difference('CartDetail.count') do
      post :create, cart_detail: { cart_id: @cart_detail.cart_id, product_id: @cart_detail.product_id, quantity: @cart_detail.quantity }
    end

    assert_redirected_to cart_detail_path(assigns(:cart_detail))
  end

  test "should show cart_detail" do
    get :show, id: @cart_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cart_detail
    assert_response :success
  end

  test "should update cart_detail" do
    patch :update, id: @cart_detail, cart_detail: { cart_id: @cart_detail.cart_id, product_id: @cart_detail.product_id, quantity: @cart_detail.quantity }
    assert_redirected_to cart_detail_path(assigns(:cart_detail))
  end

  test "should destroy cart_detail" do
    assert_difference('CartDetail.count', -1) do
      delete :destroy, id: @cart_detail
    end

    assert_redirected_to cart_details_path
  end
end
