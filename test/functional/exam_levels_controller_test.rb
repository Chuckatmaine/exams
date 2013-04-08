require 'test_helper'

class ExamLevelsControllerTest < ActionController::TestCase
  setup do
    @exam_level = exam_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exam_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam_level" do
    assert_difference('ExamLevel.count') do
      post :create, exam_level: { exam_id: @exam_level.exam_id, level_id: @exam_level.level_id }
    end

    assert_redirected_to exam_level_path(assigns(:exam_level))
  end

  test "should show exam_level" do
    get :show, id: @exam_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exam_level
    assert_response :success
  end

  test "should update exam_level" do
    put :update, id: @exam_level, exam_level: { exam_id: @exam_level.exam_id, level_id: @exam_level.level_id }
    assert_redirected_to exam_level_path(assigns(:exam_level))
  end

  test "should destroy exam_level" do
    assert_difference('ExamLevel.count', -1) do
      delete :destroy, id: @exam_level
    end

    assert_redirected_to exam_levels_path
  end
end
