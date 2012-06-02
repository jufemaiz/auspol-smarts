require 'test_helper'

class GidRedirectsControllerTest < ActionController::TestCase
  setup do
    @gid_redirect = gid_redirects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gid_redirects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gid_redirect" do
    assert_difference('GidRedirect.count') do
      post :create, gid_redirect: @gid_redirect.attributes
    end

    assert_redirected_to gid_redirect_path(assigns(:gid_redirect))
  end

  test "should show gid_redirect" do
    get :show, id: @gid_redirect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gid_redirect
    assert_response :success
  end

  test "should update gid_redirect" do
    put :update, id: @gid_redirect, gid_redirect: @gid_redirect.attributes
    assert_redirected_to gid_redirect_path(assigns(:gid_redirect))
  end

  test "should destroy gid_redirect" do
    assert_difference('GidRedirect.count', -1) do
      delete :destroy, id: @gid_redirect
    end

    assert_redirected_to gid_redirects_path
  end
end
