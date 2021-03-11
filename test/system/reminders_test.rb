require "application_system_test_case"

class RemindersTest < ApplicationSystemTestCase
  setup do
    @reminder = reminders(:one)
  end

  test "visiting the index" do
    visit reminders_url
    assert_selector "h1", text: "Reminders"
  end

  test "creating a Reminder" do
    visit reminders_url
    click_on "New Reminder"

    fill_in "Account client", with: @reminder.account_client_id
    fill_in "Message", with: @reminder.message
    click_on "Create Reminder"

    assert_text "Reminder was successfully created"
    assert_selector "h1", text: "Reminders"
  end

  test "updating a Reminder" do
    visit reminder_url(@reminder)
    click_on "Edit", match: :first

    fill_in "Account client", with: @reminder.account_client_id
    fill_in "Message", with: @reminder.message
    click_on "Update Reminder"

    assert_text "Reminder was successfully updated"
    assert_selector "h1", text: "Reminders"
  end

  test "destroying a Reminder" do
    visit edit_reminder_url(@reminder)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Reminder was successfully destroyed"
  end
end
