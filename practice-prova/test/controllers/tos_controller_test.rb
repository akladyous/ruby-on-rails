require "test_helper"

class TosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @to = tos(:one)
  end

  test "should get index" do
    get tos_url
    assert_response :success
  end

  test "should get new" do
    get new_to_url
    assert_response :success
  end

  test "should create to" do
    assert_difference("To.count") do
      post tos_url, params: { to: { task: @to.task } }
    end

    assert_redirected_to to_url(To.last)
  end

  test "should show to" do
    get to_url(@to)
    assert_response :success
  end

  test "should get edit" do
    get edit_to_url(@to)
    assert_response :success
  end

  test "should update to" do
    patch to_url(@to), params: { to: { task: @to.task } }
    assert_redirected_to to_url(@to)
  end

  test "should destroy to" do
    assert_difference("To.count", -1) do
      delete to_url(@to)
    end

    assert_redirected_to tos_url
  end
end
