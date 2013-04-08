require 'test_helper'

class QuestionLevelsControllerTest < ActionController::TestCase
  setup do
    @question_level = question_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_level" do
    assert_difference('QuestionLevel.count') do
      post :create, question_level: { level_id: @question_level.level_id, question_id: @question_level.question_id }
    end

    assert_redirected_to question_level_path(assigns(:question_level))
  end

  test "should show question_level" do
    get :show, id: @question_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_level
    assert_response :success
  end

  test "should update question_level" do
    put :update, id: @question_level, question_level: { level_id: @question_level.level_id, question_id: @question_level.question_id }
    assert_redirected_to question_level_path(assigns(:question_level))
  end

  test "should destroy question_level" do
    assert_difference('QuestionLevel.count', -1) do
      delete :destroy, id: @question_level
    end

    assert_redirected_to question_levels_path
  end
end
