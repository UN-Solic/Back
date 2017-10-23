require 'test_helper'

class IrradianceMeasuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @irradiance_measure = irradiance_measures(:one)
  end

  test "should get index" do
    get irradiance_measures_url
    assert_response :success
  end

  test "should get new" do
    get new_irradiance_measure_url
    assert_response :success
  end

  test "should create irradiance_measure" do
    assert_difference('IrradianceMeasure.count') do
      post irradiance_measures_url, params: { irradiance_measure: {  } }
    end

    assert_redirected_to irradiance_measure_url(IrradianceMeasure.last)
  end

  test "should show irradiance_measure" do
    get irradiance_measure_url(@irradiance_measure)
    assert_response :success
  end

  test "should get edit" do
    get edit_irradiance_measure_url(@irradiance_measure)
    assert_response :success
  end

  test "should update irradiance_measure" do
    patch irradiance_measure_url(@irradiance_measure), params: { irradiance_measure: {  } }
    assert_redirected_to irradiance_measure_url(@irradiance_measure)
  end

  test "should destroy irradiance_measure" do
    assert_difference('IrradianceMeasure.count', -1) do
      delete irradiance_measure_url(@irradiance_measure)
    end

    assert_redirected_to irradiance_measures_url
  end
end
