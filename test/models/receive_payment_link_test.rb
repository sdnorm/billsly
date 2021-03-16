# == Schema Information
#
# Table name: receive_payment_links
#
#  id         :bigint           not null, primary key
#  link       :string
#  name       :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#
# Indexes
#
#  index_receive_payment_links_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "test_helper"

class ReceivePaymentLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
