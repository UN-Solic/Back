require 'test_helper'

class TempMeasuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temp_measure = temp_measures(:one)
  end

  test "should get index" do
    get temp_measures_url
    assert_response :success
  end

  test "should get new" do
    get new_temp_measure_url
    assert_response :success
  end

  test "should create temp_measure" do
    assert_difference('TempMeasure.count') do
      post temp_measures_url, params: { temp_measure: { device_id: @temp_measure.device_id, measure: @temp_measure.measure, time: @temp_measure.time } }
    end

    assert_redirected_to temp_measure_url(TempMeasure.last)
  end

  test "should show temp_measure" do
    get temp_measure_url(@temp_measure)
    assert_response :success
  end

  test "should get edit" do
    get edit_temp_measure_url(@temp_measure)
    assert_response :success
  end

  test "should update temp_measure" do
    patch temp_measure_url(@temp_measure), params: { temp_measure: { device_id: @temp_measure.device_id, measure: @temp_measure.measure, time: @temp_measure.time } }
    assert_redirected_to temp_measure_url(@temp_measure)
  end

  test "should destroy temp_measure" do
    assert_difference('TempMeasure.count', -1) do
      delete temp_measure_url(@temp_measure)
    end

    assert_redirected_to temp_measures_url
  end
end
