require 'test_helper'

class ReportQuestionsControllerTest < ActionController::TestCase
  setup do
    @report_question = report_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_question" do
    assert_difference('ReportQuestion.count') do
      post :create, report_question: {  }
    end

    assert_redirected_to report_question_path(assigns(:report_question))
  end

  test "should show report_question" do
    get :show, id: @report_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_question
    assert_response :success
  end

  test "should update report_question" do
    put :update, id: @report_question, report_question: {  }
    assert_redirected_to report_question_path(assigns(:report_question))
  end

  test "should destroy report_question" do
    assert_difference('ReportQuestion.count', -1) do
      delete :destroy, id: @report_question
    end

    assert_redirected_to report_questions_path
  end
end
