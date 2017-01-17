require 'test_helper'

class MenuItemsControllerTest < ActionController::TestCase
  setup do
    @brand = brands(:one)
    @menu_item = menu_items(:one)
  end

  test "should get index" do
    get :index, params: { brand_id: @brand }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { brand_id: @brand }
    assert_response :success
  end

  test "should create menu_item" do
    assert_difference('MenuItem.count') do
      post :create, params: { brand_id: @brand, menu_item: @menu_item.attributes }
    end

    assert_redirected_to brand_menu_item_path(@brand, MenuItem.last)
  end

  test "should show menu_item" do
    get :show, params: { brand_id: @brand, id: @menu_item }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { brand_id: @brand, id: @menu_item }
    assert_response :success
  end

  test "should update menu_item" do
    put :update, params: { brand_id: @brand, id: @menu_item, menu_item: @menu_item.attributes }
    assert_redirected_to brand_menu_item_path(@brand, MenuItem.last)
  end

  test "should destroy menu_item" do
    assert_difference('MenuItem.count', -1) do
      delete :destroy, params: { brand_id: @brand, id: @menu_item }
    end

    assert_redirected_to brand_menu_items_path(@brand)
  end
end
