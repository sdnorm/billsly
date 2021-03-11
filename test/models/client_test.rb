# == Schema Information
#
# Table name: clients
#
#  id                     :bigint           not null, primary key
#  address1               :string
#  address2               :string
#  city                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  state                  :string
#  zip_code               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  account_id             :bigint           not null
#
# Indexes
#
#  index_clients_on_account_id            (account_id)
#  index_clients_on_email                 (email) UNIQUE
#  index_clients_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
