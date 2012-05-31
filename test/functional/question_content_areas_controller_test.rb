require 'test_helper'

class QuestionContentAreasControllerTest < ActionController::TestCase
  setup do
    @question_content_area = question_content_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_content_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_content_area" do
    assert_difference('QuestionContentArea.count') do
      post :create, question_content_area: { content_area_id: @question_content_area.content_area_id, question_id: @question_content_area.question_id }
    end

    assert_redirected_to question_content_area_path(assigns(:question_content_area))
  end

  test "should show question_content_area" do
    get :show, id: @question_content_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_content_area
    assert_response :success
  end

  test "should update question_content_area" do
    put :update, id: @question_content_area, question_content_area: { content_area_id: @question_content_area.content_area_id, question_id: @question_content_area.question_id }
    assert_redirected_to question_content_area_path(assigns(:question_content_area))
  end

  test "should destroy question_content_area" do
    assert_difference('QuestionContentArea.count', -1) do
      delete :destroy, id: @question_content_area
    end

    assert_redirected_to question_content_areas_path
  end
end
