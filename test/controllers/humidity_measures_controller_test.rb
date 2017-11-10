require 'test_helper'

class HumidityMeasuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @humidity_measure = humidity_measures(:one)
  end

  test "should get index" do
    get humidity_measures_url
    assert_response :success
  end

  test "should get new" do
    get new_humidity_measure_url
    assert_response :success
  end

  test "should create humidity_measure" do
    assert_difference('HumidityMeasure.count') do
      post humidity_measures_url, params: { humidity_measure: { device_id: @humidity_measure.device_id, measure: @humidity_measure.measure, time: @humidity_measure.time } }
    end

    assert_redirected_to humidity_measure_url(HumidityMeasure.last)
  end

  test "should show humidity_measure" do
    get humidity_measure_url(@humidity_measure)
    assert_response :success
  end

  test "should get edit" do
    get edit_humidity_measure_url(@humidity_measure)
    assert_response :success
  end

  test "should update humidity_measure" do
    patch humidity_measure_url(@humidity_measure), params: { humidity_measure: { device_id: @humidity_measure.device_id, measure: @humidity_measure.measure, time: @humidity_measure.time } }
    assert_redirected_to humidity_measure_url(@humidity_measure)
  end

  test "should destroy humidity_measure" do
    assert_difference('HumidityMeasure.count', -1) do
      delete humidity_measure_url(@humidity_measure)
    end

    assert_redirected_to humidity_measures_url
  end
end
