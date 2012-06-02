require 'test_helper'

class PostcodeLookupsControllerTest < ActionController::TestCase
  setup do
    @postcode_lookup = postcode_lookups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postcode_lookups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postcode_lookup" do
    assert_difference('PostcodeLookup.count') do
      post :create, postcode_lookup: @postcode_lookup.attributes
    end

    assert_redirected_to postcode_lookup_path(assigns(:postcode_lookup))
  end

  test "should show postcode_lookup" do
    get :show, id: @postcode_lookup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postcode_lookup
    assert_response :success
  end

  test "should update postcode_lookup" do
    put :update, id: @postcode_lookup, postcode_lookup: @postcode_lookup.attributes
    assert_redirected_to postcode_lookup_path(assigns(:postcode_lookup))
  end

  test "should destroy postcode_lookup" do
    assert_difference('PostcodeLookup.count', -1) do
      delete :destroy, id: @postcode_lookup
    end

    assert_redirected_to postcode_lookups_path
  end
end
