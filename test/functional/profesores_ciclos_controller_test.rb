require 'test_helper'

class ProfesoresCiclosControllerTest < ActionController::TestCase
  setup do
    @profesor_ciclo = profesores_ciclos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profesores_ciclos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profesor_ciclo" do
    assert_difference('ProfesorCiclo.count') do
      post :create, :profesor_ciclo => @profesor_ciclo.attributes
    end

    assert_redirected_to profesor_ciclo_path(assigns(:profesor_ciclo))
  end

  test "should show profesor_ciclo" do
    get :show, :id => @profesor_ciclo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @profesor_ciclo.to_param
    assert_response :success
  end

  test "should update profesor_ciclo" do
    put :update, :id => @profesor_ciclo.to_param, :profesor_ciclo => @profesor_ciclo.attributes
    assert_redirected_to profesor_ciclo_path(assigns(:profesor_ciclo))
  end

  test "should destroy profesor_ciclo" do
    assert_difference('ProfesorCiclo.count', -1) do
      delete :destroy, :id => @profesor_ciclo.to_param
    end

    assert_redirected_to profesores_ciclos_path
  end
end
