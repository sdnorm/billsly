class WorkCompleteMailer < ApplicationMailer
  default from: "hello@billsly.co"

  def test
    mail(to: "spencer@billsly.co",
    subject: "Tester Balls Emails")
  end

end
