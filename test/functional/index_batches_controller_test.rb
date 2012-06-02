require 'test_helper'

class IndexBatchesControllerTest < ActionController::TestCase
  setup do
    @index_batch = index_batches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:index_batches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create index_batch" do
    assert_difference('IndexBatch.count') do
      post :create, index_batch: @index_batch.attributes
    end

    assert_redirected_to index_batch_path(assigns(:index_batch))
  end

  test "should show index_batch" do
    get :show, id: @index_batch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @index_batch
    assert_response :success
  end

  test "should update index_batch" do
    put :update, id: @index_batch, index_batch: @index_batch.attributes
    assert_redirected_to index_batch_path(assigns(:index_batch))
  end

  test "should destroy index_batch" do
    assert_difference('IndexBatch.count', -1) do
      delete :destroy, id: @index_batch
    end

    assert_redirected_to index_batches_path
  end
end
