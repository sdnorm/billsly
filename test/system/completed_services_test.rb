require "application_system_test_case"

class CompletedServicesTest < ApplicationSystemTestCase
  setup do
    @completed_service = completed_services(:one)
  end

  test "visiting the index" do
    visit completed_services_url
    assert_selector "h1", text: "Completed Services"
  end

  test "creating a Completed service" do
    visit completed_services_url
    click_on "New Completed Service"

    fill_in "Account", with: @completed_service.account_id
    fill_in "Client profile", with: @completed_service.client_profile_id
    click_on "Create Completed service"

    assert_text "Completed service was successfully created"
    assert_selector "h1", text: "Completed Services"
  end

  test "updating a Completed service" do
    visit completed_service_url(@completed_service)
    click_on "Edit", match: :first

    fill_in "Account", with: @completed_service.account_id
    fill_in "Client profile", with: @completed_service.client_profile_id
    click_on "Update Completed service"

    assert_text "Completed service was successfully updated"
    assert_selector "h1", text: "Completed Services"
  end

  test "destroying a Completed service" do
    visit edit_completed_service_url(@completed_service)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Completed service was successfully destroyed"
  end
end
