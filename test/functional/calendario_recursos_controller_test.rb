require 'test_helper'

class CalendarioRecursosControllerTest < ActionController::TestCase
  setup do
    @calendario_recurso = calendario_recursos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendario_recursos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendario_recurso" do
    assert_difference('CalendarioRecurso.count') do
      post :create, :calendario_recurso => @calendario_recurso.attributes
    end

    assert_redirected_to calendario_recurso_path(assigns(:calendario_recurso))
  end

  test "should show calendario_recurso" do
    get :show, :id => @calendario_recurso.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @calendario_recurso.to_param
    assert_response :success
  end

  test "should update calendario_recurso" do
    put :update, :id => @calendario_recurso.to_param, :calendario_recurso => @calendario_recurso.attributes
    assert_redirected_to calendario_recurso_path(assigns(:calendario_recurso))
  end

  test "should destroy calendario_recurso" do
    assert_difference('CalendarioRecurso.count', -1) do
      delete :destroy, :id => @calendario_recurso.to_param
    end

    assert_redirected_to calendario_recursos_path
  end
end
