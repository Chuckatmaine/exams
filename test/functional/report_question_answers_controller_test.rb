require 'test_helper'

class ReportQuestionAnswersControllerTest < ActionController::TestCase
  setup do
    @report_question_answer = report_question_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_question_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_question_answer" do
    assert_difference('ReportQuestionAnswer.count') do
      post :create, report_question_answer: { count: @report_question_answer.count, question_answer_id: @report_question_answer.question_answer_id, report_id: @report_question_answer.report_id }
    end

    assert_redirected_to report_question_answer_path(assigns(:report_question_answer))
  end

  test "should show report_question_answer" do
    get :show, id: @report_question_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_question_answer
    assert_response :success
  end

  test "should update report_question_answer" do
    put :update, id: @report_question_answer, report_question_answer: { count: @report_question_answer.count, question_answer_id: @report_question_answer.question_answer_id, report_id: @report_question_answer.report_id }
    assert_redirected_to report_question_answer_path(assigns(:report_question_answer))
  end

  test "should destroy report_question_answer" do
    assert_difference('ReportQuestionAnswer.count', -1) do
      delete :destroy, id: @report_question_answer
    end

    assert_redirected_to report_question_answers_path
  end
end
