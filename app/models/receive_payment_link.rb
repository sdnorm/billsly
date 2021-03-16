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
class ReceivePaymentLink < ApplicationRecord

  belongs_to :account

  enum name: {
    other: 0,
    paypal: 1,
    venmo: 2
  }

end
