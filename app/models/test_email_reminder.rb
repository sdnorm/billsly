class TestEmailReminder < ApplicationRecord
  belongs_to :user

  after_create :send_test

  def send_test
    TestReminderMailer.with(user: self.user, account: self.user.accounts.first).reminder_email.deliver_now
  end
  
end
