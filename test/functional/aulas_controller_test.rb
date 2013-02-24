require 'test_helper'

class AulasControllerTest < ActionController::TestCase
  setup do
    @aula = aulas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aulas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aula" do
    assert_difference('Aula.count') do
      post :create, :aula => @aula.attributes
    end

    assert_redirected_to aula_path(assigns(:aula))
  end

  test "should show aula" do
    get :show, :id => @aula.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @aula.to_param
    assert_response :success
  end

  test "should update aula" do
    put :update, :id => @aula.to_param, :aula => @aula.attributes
    assert_redirected_to aula_path(assigns(:aula))
  end

  test "should destroy aula" do
    assert_difference('Aula.count', -1) do
      delete :destroy, :id => @aula.to_param
    end

    assert_redirected_to aulas_path
  end
end
