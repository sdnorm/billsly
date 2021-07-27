# == Schema Information
#
# Table name: completed_services
#
#  id                  :bigint           not null, primary key
#  dollar_amount       :decimal(, )
#  type_of_reminder    :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  account_id          :bigint
#  client_profile_id   :bigint
#  provided_service_id :bigint
#
# Indexes
#
#  index_completed_services_on_account_id           (account_id)
#  index_completed_services_on_client_profile_id    (client_profile_id)
#  index_completed_services_on_provided_service_id  (provided_service_id)
#
class CompletedService < ApplicationRecord

  belongs_to :account 
  belongs_to :client_profile

  has_many :reminder

  before_save :get_dollar_amount
  after_create :send_reminder

  def get_dollar_amount
    self.dollar_amount = self.client_profile.dollar_amount
  end

  def send_reminder
    case self.client_profile.client.preferred_contact_method
    when "text"
      reminder = Reminder.create(
        account_id: self.account.id,
        client_id: self.client_profile.client.id,
        completed_service_id: self.id,
        description: "text"
      )
      reminder.single_service_text
    when "email"
      reminder = Reminder.create(
        account_id: self.account.id,
        client_id: self.client_profile.client.id,
        completed_service_id: self.id,
        description: "email"
      )
      reminder.single_service_email
    when "both"
      reminder1 = Reminder.create(
        account_id: self.account.id,
        client_id: self.client_profile.client.id,
        completed_service_id: self.id,
        description: "text"
      )
      reminder1.single_service_text
      reminder2 = Reminder.create(
        account_id: self.account.id,
        client_id: self.client_profile.client.id,
        completed_service_id: self.id,
        description: "email"
      )
      reminder2.single_service_email
    else
      reminder = Reminder.create(
      account_id: self.account.id,
      client_id: self.client_profile.client.id,
      completed_service_id: self.id,
      description: "text"
    )
      reminder.single_service_text
    end
  end

end
