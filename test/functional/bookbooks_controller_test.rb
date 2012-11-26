require 'test_helper'

class BookbooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookbook" do
    assert_difference('Bookbook.count') do
      post :create, :bookbook => { }
    end

    assert_redirected_to bookbook_path(assigns(:bookbook))
  end

  test "should show bookbook" do
    get :show, :id => bookbooks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bookbooks(:one).to_param
    assert_response :success
  end

  test "should update bookbook" do
    put :update, :id => bookbooks(:one).to_param, :bookbook => { }
    assert_redirected_to bookbook_path(assigns(:bookbook))
  end

  test "should destroy bookbook" do
    assert_difference('Bookbook.count', -1) do
      delete :destroy, :id => bookbooks(:one).to_param
    end

    assert_redirected_to bookbooks_path
  end
end
