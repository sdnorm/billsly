class TestReminderMailer < ApplicationMailer

  default from: "reminders@billsly.co"

  def reminder_email
    @user = params[:user]
    @account = params[:account]
    mail(to: @user.email, subject: "#{@account.name} has completed your service!")
  end

end
