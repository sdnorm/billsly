require "test_helper"

class ApplePayControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get apple_pay_show_url
    assert_response :success
  end
end
