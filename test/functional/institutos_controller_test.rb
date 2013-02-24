require 'test_helper'

class InstitutosControllerTest < ActionController::TestCase
  setup do
    @instituto = institutos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:institutos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instituto" do
    assert_difference('Instituto.count') do
      post :create, :instituto => @instituto.attributes
    end

    assert_redirected_to instituto_path(assigns(:instituto))
  end

  test "should show instituto" do
    get :show, :id => @instituto.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @instituto.to_param
    assert_response :success
  end

  test "should update instituto" do
    put :update, :id => @instituto.to_param, :instituto => @instituto.attributes
    assert_redirected_to instituto_path(assigns(:instituto))
  end

  test "should destroy instituto" do
    assert_difference('Instituto.count', -1) do
      delete :destroy, :id => @instituto.to_param
    end

    assert_redirected_to institutos_path
  end
end
