require 'test_helper'

class ContentAreasControllerTest < ActionController::TestCase
  setup do
    @content_area = content_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_area" do
    assert_difference('ContentArea.count') do
      post :create, content_area: { creator_id: @content_area.creator_id, department_id: @content_area.department_id, name: @content_area.name }
    end

    assert_redirected_to content_area_path(assigns(:content_area))
  end

  test "should show content_area" do
    get :show, id: @content_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_area
    assert_response :success
  end

  test "should update content_area" do
    put :update, id: @content_area, content_area: { creator_id: @content_area.creator_id, department_id: @content_area.department_id, name: @content_area.name }
    assert_redirected_to content_area_path(assigns(:content_area))
  end

  test "should destroy content_area" do
    assert_difference('ContentArea.count', -1) do
      delete :destroy, id: @content_area
    end

    assert_redirected_to content_areas_path
  end
end
