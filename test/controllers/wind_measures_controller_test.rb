require 'test_helper'

class WindMeasuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wind_measure = wind_measures(:one)
  end

  test "should get index" do
    get wind_measures_url
    assert_response :success
  end

  test "should get new" do
    get new_wind_measure_url
    assert_response :success
  end

  test "should create wind_measure" do
    assert_difference('WindMeasure.count') do
      post wind_measures_url, params: { wind_measure: { device_id: @wind_measure.device_id, measure: @wind_measure.measure, time: @wind_measure.time } }
    end

    assert_redirected_to wind_measure_url(WindMeasure.last)
  end

  test "should show wind_measure" do
    get wind_measure_url(@wind_measure)
    assert_response :success
  end

  test "should get edit" do
    get edit_wind_measure_url(@wind_measure)
    assert_response :success
  end

  test "should update wind_measure" do
    patch wind_measure_url(@wind_measure), params: { wind_measure: { device_id: @wind_measure.device_id, measure: @wind_measure.measure, time: @wind_measure.time } }
    assert_redirected_to wind_measure_url(@wind_measure)
  end

  test "should destroy wind_measure" do
    assert_difference('WindMeasure.count', -1) do
      delete wind_measure_url(@wind_measure)
    end

    assert_redirected_to wind_measures_url
  end
end
