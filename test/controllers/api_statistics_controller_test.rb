require 'test_helper'

class ApiStatisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_statistic = api_statistics(:one)
  end

  test "should get index" do
    get api_statistics_url, as: :json
    assert_response :success
  end

  test "should create api_statistic" do
    assert_difference('ApiStatistic.count') do
      post api_statistics_url, params: { api_statistic: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_statistic" do
    get api_statistic_url(@api_statistic), as: :json
    assert_response :success
  end

  test "should update api_statistic" do
    patch api_statistic_url(@api_statistic), params: { api_statistic: {  } }, as: :json
    assert_response 200
  end

end
