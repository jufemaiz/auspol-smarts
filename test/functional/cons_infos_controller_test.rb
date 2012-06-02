require 'test_helper'

class ConsInfosControllerTest < ActionController::TestCase
  setup do
    @cons_info = cons_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cons_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cons_info" do
    assert_difference('ConsInfo.count') do
      post :create, cons_info: @cons_info.attributes
    end

    assert_redirected_to cons_info_path(assigns(:cons_info))
  end

  test "should show cons_info" do
    get :show, id: @cons_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cons_info
    assert_response :success
  end

  test "should update cons_info" do
    put :update, id: @cons_info, cons_info: @cons_info.attributes
    assert_redirected_to cons_info_path(assigns(:cons_info))
  end

  test "should destroy cons_info" do
    assert_difference('ConsInfo.count', -1) do
      delete :destroy, id: @cons_info
    end

    assert_redirected_to cons_infos_path
  end
end
