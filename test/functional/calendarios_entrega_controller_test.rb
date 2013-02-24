require 'test_helper'

class CalendariosEntregaControllerTest < ActionController::TestCase
  setup do
    @calendario_entrega = calendarios_entrega(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendarios_entrega)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendario_entrega" do
    assert_difference('CalendarioEntrega.count') do
      post :create, :calendario_entrega => @calendario_entrega.attributes
    end

    assert_redirected_to calendario_entrega_path(assigns(:calendario_entrega))
  end

  test "should show calendario_entrega" do
    get :show, :id => @calendario_entrega.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @calendario_entrega.to_param
    assert_response :success
  end

  test "should update calendario_entrega" do
    put :update, :id => @calendario_entrega.to_param, :calendario_entrega => @calendario_entrega.attributes
    assert_redirected_to calendario_entrega_path(assigns(:calendario_entrega))
  end

  test "should destroy calendario_entrega" do
    assert_difference('CalendarioEntrega.count', -1) do
      delete :destroy, :id => @calendario_entrega.to_param
    end

    assert_redirected_to calendarios_entrega_path
  end
end
