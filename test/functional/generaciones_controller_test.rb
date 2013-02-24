require 'test_helper'

class GeneracionesControllerTest < ActionController::TestCase
  setup do
    @generacion = generaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create generacion" do
    assert_difference('Generacion.count') do
      post :create, :generacion => @generacion.attributes
    end

    assert_redirected_to generacion_path(assigns(:generacion))
  end

  test "should show generacion" do
    get :show, :id => @generacion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @generacion.to_param
    assert_response :success
  end

  test "should update generacion" do
    put :update, :id => @generacion.to_param, :generacion => @generacion.attributes
    assert_redirected_to generacion_path(assigns(:generacion))
  end

  test "should destroy generacion" do
    assert_difference('Generacion.count', -1) do
      delete :destroy, :id => @generacion.to_param
    end

    assert_redirected_to generaciones_path
  end
end
