require "test_helper"

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get demo_index_url
    assert_response :success
  end

  test "should get create" do
    get demo_create_url
    assert_response :success
  end

  test "should get update" do
    get demo_update_url
    assert_response :success
  end

  test "should get delete" do
    get demo_delete_url
    assert_response :success
  end
end
