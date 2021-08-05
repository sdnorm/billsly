class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_registration.subject
  #
  def new_registration(user)
    @greeting = "Hi"
    @user = user
    mail to: @user.email
  end
end
