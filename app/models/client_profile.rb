# == Schema Information
#
# Table name: client_profiles
#
#  id                     :bigint           not null, primary key
#  address1               :string
#  address2               :string
#  city                   :string
#  dollar_amount          :decimal(, )
#  dollar_amount_in_cents :bigint
#  last_reminder_message  :text
#  payment_option         :bigint
#  payment_options        :bigint           is an Array
#  reminder_message       :text
#  state                  :string
#  zip_code               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  account_id             :bigint           not null
#  client_id              :bigint           not null
#
# Indexes
#
#  index_client_profiles_on_account_id  (account_id)
#  index_client_profiles_on_client_id   (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (client_id => clients.id)
#
class ClientProfile < ApplicationRecord

  belongs_to :account
  belongs_to :client

  # has_many :sp_payment_links
  # accepts_nested_attributes_for :sp_payment_links, allow_destroy: true

  has_rich_text :reminder_message
  
end
