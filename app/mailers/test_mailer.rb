class TestMailer < ApplicationMailer
  default from: "hello@billsly.co"

  def send_tester_balls
    mail(to: "spencer@billsly.co",
    subject: "Tester Balls Emails")
  end

end
