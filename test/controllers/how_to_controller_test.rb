require "test_helper"

class HowToControllerTest < ActionDispatch::IntegrationTest
  test "should get get_venmo_link" do
    get how_to_get_venmo_link_url
    assert_response :success
  end

  test "should get get_paypal_link" do
    get how_to_get_paypal_link_url
    assert_response :success
  end
end
