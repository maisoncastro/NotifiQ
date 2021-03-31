class ConfirmationMailer < ApplicationMailer
  default from: "nazimsesen@gmail.com"

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirmation Email')
  end
end
