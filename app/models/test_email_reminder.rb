# == Schema Information
#
# Table name: test_email_reminders
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_test_email_reminders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class TestEmailReminder < ApplicationRecord
  belongs_to :user

  after_create :send_test

  def send_test
    TestReminderMailer.with(user: self.user, account: self.user.accounts.first).reminder_email.deliver_now
  end
  
end
