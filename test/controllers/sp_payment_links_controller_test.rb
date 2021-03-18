require "test_helper"

class SpPaymentLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sp_payment_link = sp_payment_links(:one)
  end

  test "should get index" do
    get sp_payment_links_url
    assert_response :success
  end

  test "should get new" do
    get new_sp_payment_link_url
    assert_response :success
  end

  test "should create sp_payment_link" do
    assert_difference('SpPaymentLink.count') do
      post sp_payment_links_url, params: { sp_payment_link: { account: @sp_payment_link.account, link: @sp_payment_link.link, name: @sp_payment_link.name } }
    end

    assert_redirected_to sp_payment_link_url(SpPaymentLink.last)
  end

  test "should show sp_payment_link" do
    get sp_payment_link_url(@sp_payment_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_sp_payment_link_url(@sp_payment_link)
    assert_response :success
  end

  test "should update sp_payment_link" do
    patch sp_payment_link_url(@sp_payment_link), params: { sp_payment_link: { account: @sp_payment_link.account, link: @sp_payment_link.link, name: @sp_payment_link.name } }
    assert_redirected_to sp_payment_link_url(@sp_payment_link)
  end

  test "should destroy sp_payment_link" do
    assert_difference('SpPaymentLink.count', -1) do
      delete sp_payment_link_url(@sp_payment_link)
    end

    assert_redirected_to sp_payment_links_url
  end
end
