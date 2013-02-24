require 'test_helper'

class SemestresControllerTest < ActionController::TestCase
  setup do
    @semestre = semestres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:semestres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create semestre" do
    assert_difference('Semestre.count') do
      post :create, :semestre => @semestre.attributes
    end

    assert_redirected_to semestre_path(assigns(:semestre))
  end

  test "should show semestre" do
    get :show, :id => @semestre.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @semestre.to_param
    assert_response :success
  end

  test "should update semestre" do
    put :update, :id => @semestre.to_param, :semestre => @semestre.attributes
    assert_redirected_to semestre_path(assigns(:semestre))
  end

  test "should destroy semestre" do
    assert_difference('Semestre.count', -1) do
      delete :destroy, :id => @semestre.to_param
    end

    assert_redirected_to semestres_path
  end
end
