require 'test_helper'

class MaillotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maillot = maillots(:one)
  end

  test "should get index" do
    get maillots_url
    assert_response :success
  end

  test "should get new" do
    get new_maillot_url
    assert_response :success
  end

  test "should create maillot" do
    assert_difference('Maillot.count') do
      post maillots_url, params: { maillot: { 
        description: "tuchelos", 
        image_url: "bor1.jpg",
         price: 50, 
         title: "un autre maillot" 
       }
          }
    end

    assert_redirected_to maillot_url(Maillot.last)
  end

  test "should show maillot" do
    get maillot_url(@maillot)
    assert_response :success
  end

  test "should get edit" do
    get edit_maillot_url(@maillot)
    assert_response :success
  end

  test "should update maillot" do
    patch maillot_url(@maillot), params: { maillot: { description: @maillot.description, image_url: @maillot.image_url, price: @maillot.price, title: @maillot.title } }
    assert_redirected_to maillot_url(@maillot)
  end

  test "should destroy maillot" do
    assert_difference('Maillot.count', -1) do
      delete maillot_url(@maillot)
    end

    assert_redirected_to maillots_url
  end
end
