# == Schema Information
#
# Table name: clients
#
#  id                       :bigint           not null, primary key
#  address1                 :string
#  address2                 :string
#  city                     :string
#  email                    :string
#  first_name               :string
#  last_name                :string
#  phone_number             :string
#  preferred_contact_method :bigint
#  state                    :string
#  terms_and_conditions     :boolean
#  zip_code                 :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  account_id               :bigint
#
# Indexes
#
#  index_clients_on_account_id  (account_id)
#
require "test_helper"

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
