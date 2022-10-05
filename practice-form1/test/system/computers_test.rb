require "application_system_test_case"

class ComputersTest < ApplicationSystemTestCase
  setup do
    @computer = computers(:one)
  end

  test "visiting the index" do
    visit computers_url
    assert_selector "h1", text: "Computers"
  end

  test "should create computer" do
    visit computers_url
    click_on "New computer"

    check "Cdrom" if @computer.cdrom
    fill_in "Cpu", with: @computer.cpu
    fill_in "Hdd", with: @computer.hdd
    fill_in "Ram", with: @computer.ram
    click_on "Create Computer"

    assert_text "Computer was successfully created"
    click_on "Back"
  end

  test "should update Computer" do
    visit computer_url(@computer)
    click_on "Edit this computer", match: :first

    check "Cdrom" if @computer.cdrom
    fill_in "Cpu", with: @computer.cpu
    fill_in "Hdd", with: @computer.hdd
    fill_in "Ram", with: @computer.ram
    click_on "Update Computer"

    assert_text "Computer was successfully updated"
    click_on "Back"
  end

  test "should destroy Computer" do
    visit computer_url(@computer)
    click_on "Destroy this computer", match: :first

    assert_text "Computer was successfully destroyed"
  end
end
