# == Schema Information
#
# Table name: completed_services
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  account_id          :bigint
#  client_profile_id   :bigint
#  provided_service_id :bigint
#
# Indexes
#
#  index_completed_services_on_account_id           (account_id)
#  index_completed_services_on_client_profile_id    (client_profile_id)
#  index_completed_services_on_provided_service_id  (provided_service_id)
#
require "test_helper"

class CompletedServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
