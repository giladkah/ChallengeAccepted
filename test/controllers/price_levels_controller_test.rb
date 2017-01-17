require 'test_helper'

class PriceLevelsControllerTest < ActionController::TestCase
  setup do
    @brand = brands(:one)
    @price_level = price_levels(:one)
  end

  test "should get index" do
    get :index, params: { brand_id: @brand }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { brand_id: @brand }
    assert_response :success
  end

  test "should create price_level" do
    assert_difference('PriceLevel.count') do
      post :create, params: { brand_id: @brand, price_level: @price_level.attributes }
    end

    assert_redirected_to brand_price_level_path(@brand, PriceLevel.last)
  end

  test "should show price_level" do
    get :show, params: { brand_id: @brand, id: @price_level }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { brand_id: @brand, id: @price_level }
    assert_response :success
  end

  test "should update price_level" do
    put :update, params: { brand_id: @brand, id: @price_level, price_level: @price_level.attributes }
    assert_redirected_to brand_price_level_path(@brand, PriceLevel.last)
  end

  test "should destroy price_level" do
    assert_difference('PriceLevel.count', -1) do
      delete :destroy, params: { brand_id: @brand, id: @price_level }
    end

    assert_redirected_to brand_price_levels_path(@brand)
  end
end
