require "application_system_test_case"

class ClientProfilesTest < ApplicationSystemTestCase
  setup do
    @client_profile = client_profiles(:one)
  end

  test "visiting the index" do
    visit client_profiles_url
    assert_selector "h1", text: "Client Profiles"
  end

  test "creating a Client profile" do
    visit client_profiles_url
    click_on "New Client Profile"

    fill_in "Account", with: @client_profile.account_id
    fill_in "Client", with: @client_profile.client_id
    fill_in "Reminder message", with: @client_profile.reminder_message
    click_on "Create Client profile"

    assert_text "Client profile was successfully created"
    assert_selector "h1", text: "Client Profiles"
  end

  test "updating a Client profile" do
    visit client_profile_url(@client_profile)
    click_on "Edit", match: :first

    fill_in "Account", with: @client_profile.account_id
    fill_in "Client", with: @client_profile.client_id
    fill_in "Reminder message", with: @client_profile.reminder_message
    click_on "Update Client profile"

    assert_text "Client profile was successfully updated"
    assert_selector "h1", text: "Client Profiles"
  end

  test "destroying a Client profile" do
    visit edit_client_profile_url(@client_profile)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Client profile was successfully destroyed"
  end
end
