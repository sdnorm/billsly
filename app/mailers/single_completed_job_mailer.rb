class SingleCompletedJobMailer < ApplicationMailer

  default from: "reminders@billsly.co"

  def single_job_email
    @recipient = params[:recipient]
    @account = params[:account]
    mail(to: @recipient.email, subject: "#{@account.name} has completed your service!")
  end

end
