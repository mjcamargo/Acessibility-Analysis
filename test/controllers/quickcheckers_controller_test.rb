require 'test_helper'

class QuickcheckersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quickchecker = quickcheckers(:one)
  end

  test "should get index" do
    get quickcheckers_url
    assert_response :success
  end

  test "should get new" do
    get new_quickchecker_url
    assert_response :success
  end

  test "should create quickchecker" do
    assert_difference('Quickchecker.count') do
      post quickcheckers_url, params: { quickchecker: { url1: @quickchecker.url1, url2: @quickchecker.url2, url3: @quickchecker.url3 } }
    end

    assert_redirected_to quickchecker_url(Quickchecker.last)
  end

  test "should show quickchecker" do
    get quickchecker_url(@quickchecker)
    assert_response :success
  end

  test "should get edit" do
    get edit_quickchecker_url(@quickchecker)
    assert_response :success
  end

  test "should update quickchecker" do
    patch quickchecker_url(@quickchecker), params: { quickchecker: { url1: @quickchecker.url1, url2: @quickchecker.url2, url3: @quickchecker.url3 } }
    assert_redirected_to quickchecker_url(@quickchecker)
  end

  test "should destroy quickchecker" do
    assert_difference('Quickchecker.count', -1) do
      delete quickchecker_url(@quickchecker)
    end

    assert_redirected_to quickcheckers_url
  end
end
