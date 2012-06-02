require 'test_helper'

class HansardsControllerTest < ActionController::TestCase
  setup do
    @hansard = hansards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hansards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hansard" do
    assert_difference('Hansard.count') do
      post :create, hansard: @hansard.attributes
    end

    assert_redirected_to hansard_path(assigns(:hansard))
  end

  test "should show hansard" do
    get :show, id: @hansard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hansard
    assert_response :success
  end

  test "should update hansard" do
    put :update, id: @hansard, hansard: @hansard.attributes
    assert_redirected_to hansard_path(assigns(:hansard))
  end

  test "should destroy hansard" do
    assert_difference('Hansard.count', -1) do
      delete :destroy, id: @hansard
    end

    assert_redirected_to hansards_path
  end
end
