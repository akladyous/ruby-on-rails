require "test_helper"

class ExpensiveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expensive_index_url
    assert_response :success
  end

  test "should get show" do
    get expensive_show_url
    assert_response :success
  end
end
