# == Schema Information
#
# Table name: customer_profiles
#
#  id               :bigint           not null, primary key
#  reminder_message :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  account_id       :bigint           not null
#  customer_id      :bigint           not null
#
# Indexes
#
#  index_customer_profiles_on_account_id   (account_id)
#  index_customer_profiles_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (customer_id => customers.id)
#
require "test_helper"

class CustomerProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
