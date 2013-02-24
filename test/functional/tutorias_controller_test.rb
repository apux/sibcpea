require 'test_helper'

class TutoriasControllerTest < ActionController::TestCase
  setup do
    @tutoria = tutorias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tutorias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tutoria" do
    assert_difference('Tutoria.count') do
      post :create, :tutoria => @tutoria.attributes
    end

    assert_redirected_to tutoria_path(assigns(:tutoria))
  end

  test "should show tutoria" do
    get :show, :id => @tutoria.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tutoria.to_param
    assert_response :success
  end

  test "should update tutoria" do
    put :update, :id => @tutoria.to_param, :tutoria => @tutoria.attributes
    assert_redirected_to tutoria_path(assigns(:tutoria))
  end

  test "should destroy tutoria" do
    assert_difference('Tutoria.count', -1) do
      delete :destroy, :id => @tutoria.to_param
    end

    assert_redirected_to tutorias_path
  end
end
