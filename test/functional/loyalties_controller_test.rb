require 'test_helper'

class LoyaltiesControllerTest < ActionController::TestCase
  setup do
    @loyalty = loyalties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loyalties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loyalty" do
    assert_difference('Loyalty.count') do
      post :create, loyalty: @loyalty.attributes
    end

    assert_redirected_to loyalty_path(assigns(:loyalty))
  end

  test "should show loyalty" do
    get :show, id: @loyalty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loyalty
    assert_response :success
  end

  test "should update loyalty" do
    put :update, id: @loyalty, loyalty: @loyalty.attributes
    assert_redirected_to loyalty_path(assigns(:loyalty))
  end

  test "should destroy loyalty" do
    assert_difference('Loyalty.count', -1) do
      delete :destroy, id: @loyalty
    end

    assert_redirected_to loyalties_path
  end
end
