# == Schema Information
#
# Table name: provided_services
#
#  id                :bigint           not null, primary key
#  description       :text
#  name              :string
#  price             :bigint
#  price_in_cents    :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  account_id        :bigint
#  client_profile_id :bigint
#
# Indexes
#
#  index_provided_services_on_account_id         (account_id)
#  index_provided_services_on_client_profile_id  (client_profile_id)
#
class ProvidedService < ApplicationRecord

  has_many :clients_provided_services, dependent: :destroy 
  has_many :clients, through: :clients_provided_services

end
