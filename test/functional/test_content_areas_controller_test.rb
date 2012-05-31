require 'test_helper'

class TestContentAreasControllerTest < ActionController::TestCase
  setup do
    @test_content_area = test_content_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_content_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_content_area" do
    assert_difference('TestContentArea.count') do
      post :create, test_content_area: { content_area_id: @test_content_area.content_area_id, count: @test_content_area.count, test_id: @test_content_area.test_id }
    end

    assert_redirected_to test_content_area_path(assigns(:test_content_area))
  end

  test "should show test_content_area" do
    get :show, id: @test_content_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_content_area
    assert_response :success
  end

  test "should update test_content_area" do
    put :update, id: @test_content_area, test_content_area: { content_area_id: @test_content_area.content_area_id, count: @test_content_area.count, test_id: @test_content_area.test_id }
    assert_redirected_to test_content_area_path(assigns(:test_content_area))
  end

  test "should destroy test_content_area" do
    assert_difference('TestContentArea.count', -1) do
      delete :destroy, id: @test_content_area
    end

    assert_redirected_to test_content_areas_path
  end
end
