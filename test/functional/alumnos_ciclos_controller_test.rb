require 'test_helper'

class AlumnosCiclosControllerTest < ActionController::TestCase
  setup do
    @alumno_ciclo = alumnos_ciclos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alumnos_ciclos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alumno_ciclo" do
    assert_difference('AlumnoCiclo.count') do
      post :create, :alumno_ciclo => @alumno_ciclo.attributes
    end

    assert_redirected_to alumno_ciclo_path(assigns(:alumno_ciclo))
  end

  test "should show alumno_ciclo" do
    get :show, :id => @alumno_ciclo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @alumno_ciclo.to_param
    assert_response :success
  end

  test "should update alumno_ciclo" do
    put :update, :id => @alumno_ciclo.to_param, :alumno_ciclo => @alumno_ciclo.attributes
    assert_redirected_to alumno_ciclo_path(assigns(:alumno_ciclo))
  end

  test "should destroy alumno_ciclo" do
    assert_difference('AlumnoCiclo.count', -1) do
      delete :destroy, :id => @alumno_ciclo.to_param
    end

    assert_redirected_to alumnos_ciclos_path
  end
end
