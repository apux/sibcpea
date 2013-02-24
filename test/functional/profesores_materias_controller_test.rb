require 'test_helper'

class ProfesoresMateriasControllerTest < ActionController::TestCase
  setup do
    @profesor_materia = profesores_materias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profesores_materias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profesor_materia" do
    assert_difference('ProfesorMateria.count') do
      post :create, :profesor_materia => @profesor_materia.attributes
    end

    assert_redirected_to profesor_materia_path(assigns(:profesor_materia))
  end

  test "should show profesor_materia" do
    get :show, :id => @profesor_materia.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @profesor_materia.to_param
    assert_response :success
  end

  test "should update profesor_materia" do
    put :update, :id => @profesor_materia.to_param, :profesor_materia => @profesor_materia.attributes
    assert_redirected_to profesor_materia_path(assigns(:profesor_materia))
  end

  test "should destroy profesor_materia" do
    assert_difference('ProfesorMateria.count', -1) do
      delete :destroy, :id => @profesor_materia.to_param
    end

    assert_redirected_to profesores_materias_path
  end
end
