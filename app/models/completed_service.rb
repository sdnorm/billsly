# == Schema Information
#
# Table name: completed_services
#
#  id                  :bigint           not null, primary key
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

  after_create :send_reminder

  def send_reminder
    SingleCompletedJobMailer.with(recipient: self.client_profile.client, account: self.account).single_job_email.deliver_now
  end

end
