require "application_system_test_case"

class TosTest < ApplicationSystemTestCase
  setup do
    @to = tos(:one)
  end

  test "visiting the index" do
    visit tos_url
    assert_selector "h1", text: "Tos"
  end

  test "should create to" do
    visit tos_url
    click_on "New to"

    fill_in "Task", with: @to.task
    click_on "Create To"

    assert_text "To was successfully created"
    click_on "Back"
  end

  test "should update To" do
    visit to_url(@to)
    click_on "Edit this to", match: :first

    fill_in "Task", with: @to.task
    click_on "Update To"

    assert_text "To was successfully updated"
    click_on "Back"
  end

  test "should destroy To" do
    visit to_url(@to)
    click_on "Destroy this to", match: :first

    assert_text "To was successfully destroyed"
  end
end
