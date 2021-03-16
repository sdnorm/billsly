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
#
class Customer < ApplicationRecord
  has_many :account_customers, dependent: :destroy
  has_many :accounts, through: :account_customers
end
