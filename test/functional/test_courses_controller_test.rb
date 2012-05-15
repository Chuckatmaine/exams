require 'test_helper'

class TestCoursesControllerTest < ActionController::TestCase
  setup do
    @test_course = test_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_course" do
    assert_difference('TestCourse.count') do
      post :create, test_course: { course_id: @test_course.course_id, test_id: @test_course.test_id }
    end

    assert_redirected_to test_course_path(assigns(:test_course))
  end

  test "should show test_course" do
    get :show, id: @test_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_course
    assert_response :success
  end

  test "should update test_course" do
    put :update, id: @test_course, test_course: { course_id: @test_course.course_id, test_id: @test_course.test_id }
    assert_redirected_to test_course_path(assigns(:test_course))
  end

  test "should destroy test_course" do
    assert_difference('TestCourse.count', -1) do
      delete :destroy, id: @test_course
    end

    assert_redirected_to test_courses_path
  end
end
