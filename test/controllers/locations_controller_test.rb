require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @brand = brands(:one)
    @location = locations(:one)
  end

  test "should get index" do
    get :index, params: { brand_id: @brand }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { brand_id: @brand }
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, params: { brand_id: @brand, location: @location.attributes }
    end

    assert_redirected_to brand_location_path(@brand, Location.last)
  end

  test "should show location" do
    get :show, params: { brand_id: @brand, id: @location }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { brand_id: @brand, id: @location }
    assert_response :success
  end

  test "should update location" do
    put :update, params: { brand_id: @brand, id: @location, location: @location.attributes }
    assert_redirected_to brand_location_path(@brand, Location.last)
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, params: { brand_id: @brand, id: @location }
    end

    assert_redirected_to brand_locations_path(@brand)
  end
end
