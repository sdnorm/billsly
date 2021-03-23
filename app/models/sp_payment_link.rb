# == Schema Information
#
# Table name: sp_payment_links
#
#  id                :bigint           not null, primary key
#  link              :string
#  name              :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  account_id        :bigint
#  client_profile_id :bigint
#
# Indexes
#
#  index_sp_payment_links_on_account_id         (account_id)
#  index_sp_payment_links_on_client_profile_id  (client_profile_id)
#
class SpPaymentLink < ApplicationRecord

  belongs_to :account
  # belongs_to :client_profiles, optional: true

  enum name: {
    other: 0,
    paypal: 1,
    venmo: 2
  }

end
