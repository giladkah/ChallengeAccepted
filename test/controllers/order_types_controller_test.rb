require 'test_helper'

class OrderTypesControllerTest < ActionController::TestCase
  setup do
    @brand = brands(:one)
    @order_type = order_types(:one)
  end

  test "should get index" do
    get :index, params: { brand_id: @brand }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { brand_id: @brand }
    assert_response :success
  end

  test "should create order_type" do
    assert_difference('OrderType.count') do
      post :create, params: { brand_id: @brand, order_type: @order_type.attributes }
    end

    assert_redirected_to brand_order_type_path(@brand, OrderType.last)
  end

  test "should show order_type" do
    get :show, params: { brand_id: @brand, id: @order_type }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { brand_id: @brand, id: @order_type }
    assert_response :success
  end

  test "should update order_type" do
    put :update, params: { brand_id: @brand, id: @order_type, order_type: @order_type.attributes }
    assert_redirected_to brand_order_type_path(@brand, OrderType.last)
  end

  test "should destroy order_type" do
    assert_difference('OrderType.count', -1) do
      delete :destroy, params: { brand_id: @brand, id: @order_type }
    end

    assert_redirected_to brand_order_types_path(@brand)
  end
end
