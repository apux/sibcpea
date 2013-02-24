require 'test_helper'

class EgresadosControllerTest < ActionController::TestCase
  setup do
    @egresado = egresados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:egresados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create egresado" do
    assert_difference('Egresado.count') do
      post :create, :egresado => @egresado.attributes
    end

    assert_redirected_to egresado_path(assigns(:egresado))
  end

  test "should show egresado" do
    get :show, :id => @egresado.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @egresado.to_param
    assert_response :success
  end

  test "should update egresado" do
    put :update, :id => @egresado.to_param, :egresado => @egresado.attributes
    assert_redirected_to egresado_path(assigns(:egresado))
  end

  test "should destroy egresado" do
    assert_difference('Egresado.count', -1) do
      delete :destroy, :id => @egresado.to_param
    end

    assert_redirected_to egresados_path
  end
end
