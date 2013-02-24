require 'test_helper'

class AsistenciaGruposControllerTest < ActionController::TestCase
  setup do
    @asistencia_grupo = asistencia_grupos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asistencia_grupos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asistencia_grupo" do
    assert_difference('AsistenciaGrupo.count') do
      post :create, :asistencia_grupo => @asistencia_grupo.attributes
    end

    assert_redirected_to asistencia_grupo_path(assigns(:asistencia_grupo))
  end

  test "should show asistencia_grupo" do
    get :show, :id => @asistencia_grupo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @asistencia_grupo.to_param
    assert_response :success
  end

  test "should update asistencia_grupo" do
    put :update, :id => @asistencia_grupo.to_param, :asistencia_grupo => @asistencia_grupo.attributes
    assert_redirected_to asistencia_grupo_path(assigns(:asistencia_grupo))
  end

  test "should destroy asistencia_grupo" do
    assert_difference('AsistenciaGrupo.count', -1) do
      delete :destroy, :id => @asistencia_grupo.to_param
    end

    assert_redirected_to asistencia_grupos_path
  end
end
