require 'test_helper'

class RailsControllerTest < ActionController::TestCase
  setup do
    @rail = rails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rail" do
    assert_difference('Rail.count') do
      post :create, rail: @rail.attributes
    end

    assert_redirected_to rail_path(assigns(:rail))
  end

  test "should show rail" do
    get :show, id: @rail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rail
    assert_response :success
  end

  test "should update rail" do
    put :update, id: @rail, rail: @rail.attributes
    assert_redirected_to rail_path(assigns(:rail))
  end

  test "should destroy rail" do
    assert_difference('Rail.count', -1) do
      delete :destroy, id: @rail
    end

    assert_redirected_to rails_path
  end
end
