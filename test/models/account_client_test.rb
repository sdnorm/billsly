# == Schema Information
#
# Table name: account_clients
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  client_id  :bigint           not null
#
# Indexes
#
#  index_account_clients_on_account_id  (account_id)
#  index_account_clients_on_client_id   (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (client_id => clients.id)
#
require "test_helper"

class AccountClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
