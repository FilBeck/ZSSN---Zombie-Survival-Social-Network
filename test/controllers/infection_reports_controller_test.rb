require 'test_helper'

class InfectionReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @infection_report = infection_reports(:one)
  end

  test "should get index" do
    get infection_reports_url, as: :json
    assert_response :success
  end

  test "should create infection_report" do
    assert_difference('InfectionReport.count') do
      post infection_reports_url, params: { infection_report: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show infection_report" do
    get infection_report_url(@infection_report), as: :json
    assert_response :success
  end

  test "should update infection_report" do
    patch infection_report_url(@infection_report), params: { infection_report: {  } }, as: :json
    assert_response 200
  end

  test "should destroy infection_report" do
    assert_difference('InfectionReport.count', -1) do
      delete infection_report_url(@infection_report), as: :json
    end

    assert_response 204
  end
end
