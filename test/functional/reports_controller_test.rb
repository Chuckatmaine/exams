require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post :create, report: { creator: @report.creator, department: @report.department, exam_mean: @report.exam_mean, exam_median: @report.exam_median, high_score: @report.high_score, kr20: @report.kr20, low_score: @report.low_score, mean_p: @report.mean_p, p_value: @report.p_value, pbi: @report.pbi, rundate: @report.rundate, sd: @report.sd, sem: @report.sem, variance: @report.variance }
    end

    assert_redirected_to report_path(assigns(:report))
  end

  test "should show report" do
    get :show, id: @report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report
    assert_response :success
  end

  test "should update report" do
    put :update, id: @report, report: { creator: @report.creator, department: @report.department, exam_mean: @report.exam_mean, exam_median: @report.exam_median, high_score: @report.high_score, kr20: @report.kr20, low_score: @report.low_score, mean_p: @report.mean_p, p_value: @report.p_value, pbi: @report.pbi, rundate: @report.rundate, sd: @report.sd, sem: @report.sem, variance: @report.variance }
    assert_redirected_to report_path(assigns(:report))
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to reports_path
  end
end
