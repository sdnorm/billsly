# == Schema Information
#
# Table name: client_profiles
#
#  id                       :bigint           not null, primary key
#  address1                 :string
#  address2                 :string
#  city                     :string
#  dollar_amount            :decimal(10, 2)
#  dollar_amount_in_cents   :bigint
#  last_reminder_message    :text
#  payment_option           :bigint
#  payment_options          :bigint           is an Array
#  preferred_contact_method :bigint
#  reminder_message         :text
#  state                    :string
#  zip_code                 :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  client_id                :bigint           not null
#
# Indexes
#
#  index_client_profiles_on_client_id  (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#
class ClientProfile < ApplicationRecord

  self.ignored_columns = ["account_id"]

  # belongs_to :account, optional: true
  belongs_to :client

  # has_many :sp_payment_links
  # accepts_nested_attributes_for :sp_payment_links, allow_destroy: true

  has_rich_text :reminder_message

  enum preferred_contact_method: {
    text: 0, 
    email: 1, 
    both: 2
  }#, default: :text

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
