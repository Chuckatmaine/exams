require 'test_helper'

class UserSubmitsControllerTest < ActionController::TestCase
  setup do
    @user_submit = user_submits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_submits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_submit" do
    assert_difference('UserSubmit.count') do
      post :create, user_submit: { exam_id: @user_submit.exam_id, user_id: @user_submit.user_id }
    end

    assert_redirected_to user_submit_path(assigns(:user_submit))
  end

  test "should show user_submit" do
    get :show, id: @user_submit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_submit
    assert_response :success
  end

  test "should update user_submit" do
    put :update, id: @user_submit, user_submit: { exam_id: @user_submit.exam_id, user_id: @user_submit.user_id }
    assert_redirected_to user_submit_path(assigns(:user_submit))
  end

  test "should destroy user_submit" do
    assert_difference('UserSubmit.count', -1) do
      delete :destroy, id: @user_submit
    end

    assert_redirected_to user_submits_path
  end
end
