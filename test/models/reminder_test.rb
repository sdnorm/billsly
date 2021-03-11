# == Schema Information
#
# Table name: reminders
#
#  id                :bigint           not null, primary key
#  message           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  account_client_id :bigint           not null
#
# Indexes
#
#  index_reminders_on_account_client_id  (account_client_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_client_id => account_clients.id)
#
require "test_helper"

class ReminderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
