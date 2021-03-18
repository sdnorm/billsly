require "application_system_test_case"

class SpPaymentLinksTest < ApplicationSystemTestCase
  setup do
    @sp_payment_link = sp_payment_links(:one)
  end

  test "visiting the index" do
    visit sp_payment_links_url
    assert_selector "h1", text: "Sp Payment Links"
  end

  test "creating a Sp payment link" do
    visit sp_payment_links_url
    click_on "New Sp Payment Link"

    fill_in "Account", with: @sp_payment_link.account
    fill_in "Link", with: @sp_payment_link.link
    fill_in "Name", with: @sp_payment_link.name
    click_on "Create Sp payment link"

    assert_text "Sp payment link was successfully created"
    assert_selector "h1", text: "Sp Payment Links"
  end

  test "updating a Sp payment link" do
    visit sp_payment_link_url(@sp_payment_link)
    click_on "Edit", match: :first

    fill_in "Account", with: @sp_payment_link.account
    fill_in "Link", with: @sp_payment_link.link
    fill_in "Name", with: @sp_payment_link.name
    click_on "Update Sp payment link"

    assert_text "Sp payment link was successfully updated"
    assert_selector "h1", text: "Sp Payment Links"
  end

  test "destroying a Sp payment link" do
    visit edit_sp_payment_link_url(@sp_payment_link)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Sp payment link was successfully destroyed"
  end
end
