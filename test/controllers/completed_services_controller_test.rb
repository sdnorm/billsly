require "test_helper"

class CompletedServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @completed_service = completed_services(:one)
  end

  test "should get index" do
    get completed_services_url
    assert_response :success
  end

  test "should get new" do
    get new_completed_service_url
    assert_response :success
  end

  test "should create completed_service" do
    assert_difference('CompletedService.count') do
      post completed_services_url, params: { completed_service: { account_id: @completed_service.account_id, client_profile_id: @completed_service.client_profile_id } }
    end

    assert_redirected_to completed_service_url(CompletedService.last)
  end

  test "should show completed_service" do
    get completed_service_url(@completed_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_completed_service_url(@completed_service)
    assert_response :success
  end

  test "should update completed_service" do
    patch completed_service_url(@completed_service), params: { completed_service: { account_id: @completed_service.account_id, client_profile_id: @completed_service.client_profile_id } }
    assert_redirected_to completed_service_url(@completed_service)
  end

  test "should destroy completed_service" do
    assert_difference('CompletedService.count', -1) do
      delete completed_service_url(@completed_service)
    end

    assert_redirected_to completed_services_url
  end
end
