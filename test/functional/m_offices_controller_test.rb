require 'test_helper'

class MOfficesControllerTest < ActionController::TestCase
  setup do
    @m_office = m_offices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:m_offices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create m_office" do
    assert_difference('MOffice.count') do
      post :create, m_office: @m_office.attributes
    end

    assert_redirected_to m_office_path(assigns(:m_office))
  end

  test "should show m_office" do
    get :show, id: @m_office
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @m_office
    assert_response :success
  end

  test "should update m_office" do
    put :update, id: @m_office, m_office: @m_office.attributes
    assert_redirected_to m_office_path(assigns(:m_office))
  end

  test "should destroy m_office" do
    assert_difference('MOffice.count', -1) do
      delete :destroy, id: @m_office
    end

    assert_redirected_to m_offices_path
  end
end
