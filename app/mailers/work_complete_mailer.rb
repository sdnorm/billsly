class WorkCompleteMailer < ApplicationMailer
  default from: "hello@billsly.co"

  def test
    mail(to: "justin@billsly.co",
    subject: "Tester Balls Emails")
  end

  def initial_reminder
    @client = params[:client]
    @service_provider = params[:service_provider]
    @account = params[:account]
    mail(to: @client.email, subject: "Work Complete by #{@service_provider.first_name}")
  end

end
