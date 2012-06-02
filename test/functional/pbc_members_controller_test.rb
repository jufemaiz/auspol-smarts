require 'test_helper'

class PbcMembersControllerTest < ActionController::TestCase
  setup do
    @pbc_member = pbc_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pbc_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pbc_member" do
    assert_difference('PbcMember.count') do
      post :create, pbc_member: @pbc_member.attributes
    end

    assert_redirected_to pbc_member_path(assigns(:pbc_member))
  end

  test "should show pbc_member" do
    get :show, id: @pbc_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pbc_member
    assert_response :success
  end

  test "should update pbc_member" do
    put :update, id: @pbc_member, pbc_member: @pbc_member.attributes
    assert_redirected_to pbc_member_path(assigns(:pbc_member))
  end

  test "should destroy pbc_member" do
    assert_difference('PbcMember.count', -1) do
      delete :destroy, id: @pbc_member
    end

    assert_redirected_to pbc_members_path
  end
end
