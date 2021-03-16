# == Schema Information
#
# Table name: account_customers
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :bigint           not null
#  customer_id :bigint           not null
#
# Indexes
#
#  index_account_customers_on_account_id   (account_id)
#  index_account_customers_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (customer_id => customers.id)
#
class AccountCustomer < ApplicationRecord

  belongs_to :account
  belongs_to :customer

  has_many :reminders

end
