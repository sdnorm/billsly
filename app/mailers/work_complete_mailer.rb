class WorkCompleteMailer < ApplicationMailer
  default from: "hello@billsly.co"

  def test
    mail(to: "justin@billsly.co",
    subject: "Tester Balls Emails")
  end

end
