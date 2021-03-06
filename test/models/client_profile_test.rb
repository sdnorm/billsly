# == Schema Information
#
# Table name: client_profiles
#
#  id                       :bigint           not null, primary key
#  address1                 :string
#  address2                 :string
#  city                     :string
#  dollar_amount            :decimal(10, 2)
#  dollar_amount_in_cents   :bigint
#  last_reminder_message    :text
#  payment_option           :bigint
#  payment_options          :bigint           is an Array
#  preferred_contact_method :bigint
#  reminder_message         :text
#  state                    :string
#  zip_code                 :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  client_id                :bigint           not null
#
# Indexes
#
#  index_client_profiles_on_client_id  (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#
require "test_helper"

class ClientProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
