# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  address1     :string
#  address2     :string
#  city         :string
#  email        :string
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  state        :string
#  zip_code     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_id   :bigint           not null
#
# Indexes
#
#  index_customers_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class Customer < ApplicationRecord
  belongs_to :account
end
