require 'test_helper'

class ElectoratesControllerTest < ActionController::TestCase
  setup do
    @electorate = electorates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:electorates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create electorate" do
    assert_difference('Electorate.count') do
      post :create, electorate: @electorate.attributes
    end

    assert_redirected_to electorate_path(assigns(:electorate))
  end

  test "should show electorate" do
    get :show, id: @electorate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @electorate
    assert_response :success
  end

  test "should update electorate" do
    put :update, id: @electorate, electorate: @electorate.attributes
    assert_redirected_to electorate_path(assigns(:electorate))
  end

  test "should destroy electorate" do
    assert_difference('Electorate.count', -1) do
      delete :destroy, id: @electorate
    end

    assert_redirected_to electorates_path
  end
end
