require 'test_helper'

class ExamReportsControllerTest < ActionController::TestCase
  setup do
    @exam_report = exam_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exam_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam_report" do
    assert_difference('ExamReport.count') do
      post :create, exam_report: { exam: @exam_report.exam, report: @exam_report.report }
    end

    assert_redirected_to exam_report_path(assigns(:exam_report))
  end

  test "should show exam_report" do
    get :show, id: @exam_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exam_report
    assert_response :success
  end

  test "should update exam_report" do
    put :update, id: @exam_report, exam_report: { exam: @exam_report.exam, report: @exam_report.report }
    assert_redirected_to exam_report_path(assigns(:exam_report))
  end

  test "should destroy exam_report" do
    assert_difference('ExamReport.count', -1) do
      delete :destroy, id: @exam_report
    end

    assert_redirected_to exam_reports_path
  end
end
