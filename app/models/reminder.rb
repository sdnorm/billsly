# == Schema Information
#
# Table name: reminders
#
#  id         :bigint           not null, primary key
#  message    :text
#  opened     :boolean          default(FALSE)
#  read       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  client_id  :bigint           not null
#
# Indexes
#
#  index_reminders_on_account_id  (account_id)
#  index_reminders_on_client_id   (client_id)
#
class Reminder < ApplicationRecord

  # belongs_to :account_client
  # self.ignored_columns = ["account_client_id"]

  # belongs_to :account
  # belongs_to :client

  # def self.test_email
  #   WorkCompleteMailer.test().deliver
  # end
  
end
