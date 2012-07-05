require 'test_helper'

class ExamUsersControllerTest < ActionController::TestCase
  setup do
    @exam_user = exam_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exam_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam_user" do
    assert_difference('ExamUser.count') do
      post :create, exam_user: { exam_id: @exam_user.exam_id, user_id: @exam_user.user_id }
    end

    assert_redirected_to exam_user_path(assigns(:exam_user))
  end

  test "should show exam_user" do
    get :show, id: @exam_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exam_user
    assert_response :success
  end

  test "should update exam_user" do
    put :update, id: @exam_user, exam_user: { exam_id: @exam_user.exam_id, user_id: @exam_user.user_id }
    assert_redirected_to exam_user_path(assigns(:exam_user))
  end

  test "should destroy exam_user" do
    assert_difference('ExamUser.count', -1) do
      delete :destroy, id: @exam_user
    end

    assert_redirected_to exam_users_path
  end
end
