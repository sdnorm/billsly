# == Schema Information
#
# Table name: text_messages
#
#  id                      :bigint           not null, primary key
#  batch_or_single_service :bigint
#  body                    :text
#  recipient_number        :string
#  successfully_delivered  :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  account_id              :bigint           not null
#  client_id               :bigint           not null
#
# Indexes
#
#  index_text_messages_on_account_id  (account_id)
#  index_text_messages_on_client_id   (client_id)
#
require "test_helper"

class TextMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
