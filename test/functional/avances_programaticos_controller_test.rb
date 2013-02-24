require 'test_helper'

class AvancesProgramaticosControllerTest < ActionController::TestCase
  setup do
    @avance_programatico = avances_programaticos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:avances_programaticos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create avance_programatico" do
    assert_difference('AvanceProgramatico.count') do
      post :create, :avance_programatico => @avance_programatico.attributes
    end

    assert_redirected_to avance_programatico_path(assigns(:avance_programatico))
  end

  test "should show avance_programatico" do
    get :show, :id => @avance_programatico.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @avance_programatico.to_param
    assert_response :success
  end

  test "should update avance_programatico" do
    put :update, :id => @avance_programatico.to_param, :avance_programatico => @avance_programatico.attributes
    assert_redirected_to avance_programatico_path(assigns(:avance_programatico))
  end

  test "should destroy avance_programatico" do
    assert_difference('AvanceProgramatico.count', -1) do
      delete :destroy, :id => @avance_programatico.to_param
    end

    assert_redirected_to avances_programaticos_path
  end
end
