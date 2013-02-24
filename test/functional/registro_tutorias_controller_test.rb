require 'test_helper'

class RegistroTutoriasControllerTest < ActionController::TestCase
  setup do
    @registro_tutoria = registro_tutorias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registro_tutorias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registro_tutoria" do
    assert_difference('RegistroTutoria.count') do
      post :create, :registro_tutoria => @registro_tutoria.attributes
    end

    assert_redirected_to registro_tutoria_path(assigns(:registro_tutoria))
  end

  test "should show registro_tutoria" do
    get :show, :id => @registro_tutoria.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @registro_tutoria.to_param
    assert_response :success
  end

  test "should update registro_tutoria" do
    put :update, :id => @registro_tutoria.to_param, :registro_tutoria => @registro_tutoria.attributes
    assert_redirected_to registro_tutoria_path(assigns(:registro_tutoria))
  end

  test "should destroy registro_tutoria" do
    assert_difference('RegistroTutoria.count', -1) do
      delete :destroy, :id => @registro_tutoria.to_param
    end

    assert_redirected_to registro_tutorias_path
  end
end
