# == Schema Information
#
# Table name: clients
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
class Client < ApplicationRecord

  has_many :account_clients, dependent: :destroy
  has_many :accounts, through: :account_clients

  has_many :client_profiles

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_street_address
    if address2.nil?
      "#{address1}"
    else
      "#{address1} #{address2}"
    end
  end

  def city_state_zip
    "#{city}, #{state} #{zip_code}"
  end

end
