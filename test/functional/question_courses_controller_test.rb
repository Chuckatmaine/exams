require 'test_helper'

class QuestionCoursesControllerTest < ActionController::TestCase
  setup do
    @question_course = question_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_course" do
    assert_difference('QuestionCourse.count') do
      post :create, question_course: { course_id: @question_course.course_id, question_id: @question_course.question_id }
    end

    assert_redirected_to question_course_path(assigns(:question_course))
  end

  test "should show question_course" do
    get :show, id: @question_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_course
    assert_response :success
  end

  test "should update question_course" do
    put :update, id: @question_course, question_course: { course_id: @question_course.course_id, question_id: @question_course.question_id }
    assert_redirected_to question_course_path(assigns(:question_course))
  end

  test "should destroy question_course" do
    assert_difference('QuestionCourse.count', -1) do
      delete :destroy, id: @question_course
    end

    assert_redirected_to question_courses_path
  end
end
