require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get carts_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_url
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post carts_url, params: { cart: {  } }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should show cart" do
    get cart_url(@cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_cart_url(@cart)
    assert_response :success
  end

  test "should update cart" do
    patch cart_url(@cart), params: { cart: {  } }
    assert_redirected_to cart_url(@cart)
  end
  test "should not destroy cart" do
  post line_items_url, params: { maillot_id: maillots(:one).id }

  assert_no_difference('Cart.count') do
    delete cart_url(@cart)
  end

  assert_response 204
end

test "should destroy cart if session matches" do
  post line_items_url, params: { maillot_id: maillots(:one).id }
  @cart = Cart.find(session[:cart_id])

  assert_difference('Cart.count', -1) do
    delete cart_url(@cart)
  end

  assert_redirected_to root_url
end

end
