require 'test_helper'

class ContentareasControllerTest < ActionController::TestCase
  setup do
    @contentarea = contentareas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contentareas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contentarea" do
    assert_difference('Contentarea.count') do
      post :create, contentarea: { creator: @contentarea.creator, department_id: @contentarea.department_id, name: @contentarea.name }
    end

    assert_redirected_to contentarea_path(assigns(:contentarea))
  end

  test "should show contentarea" do
    get :show, id: @contentarea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contentarea
    assert_response :success
  end

  test "should update contentarea" do
    put :update, id: @contentarea, contentarea: { creator: @contentarea.creator, department_id: @contentarea.department_id, name: @contentarea.name }
    assert_redirected_to contentarea_path(assigns(:contentarea))
  end

  test "should destroy contentarea" do
    assert_difference('Contentarea.count', -1) do
      delete :destroy, id: @contentarea
    end

    assert_redirected_to contentareas_path
  end
end
