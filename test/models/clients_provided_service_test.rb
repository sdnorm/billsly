# == Schema Information
#
# Table name: clients_provided_services
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  client_id           :bigint           not null
#  provided_service_id :bigint           not null
#
# Indexes
#
#  index_clients_provided_services_on_client_id            (client_id)
#  index_clients_provided_services_on_provided_service_id  (provided_service_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#  fk_rails_...  (provided_service_id => provided_services.id)
#
require "test_helper"

class ClientsProvidedServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
