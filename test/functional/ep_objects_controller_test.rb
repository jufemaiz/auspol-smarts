require 'test_helper'

class EpObjectsControllerTest < ActionController::TestCase
  setup do
    @ep_object = ep_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ep_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ep_object" do
    assert_difference('EpObject.count') do
      post :create, ep_object: @ep_object.attributes
    end

    assert_redirected_to ep_object_path(assigns(:ep_object))
  end

  test "should show ep_object" do
    get :show, id: @ep_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ep_object
    assert_response :success
  end

  test "should update ep_object" do
    put :update, id: @ep_object, ep_object: @ep_object.attributes
    assert_redirected_to ep_object_path(assigns(:ep_object))
  end

  test "should destroy ep_object" do
    assert_difference('EpObject.count', -1) do
      delete :destroy, id: @ep_object
    end

    assert_redirected_to ep_objects_path
  end
end
