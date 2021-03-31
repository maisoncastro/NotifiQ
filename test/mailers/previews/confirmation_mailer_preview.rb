# Preview all emails at http://localhost:3000/rails/mailers/confirmation_mailer
class ConfirmationMailerPreview < ActionMailer::Preview
  def confirmation_mail_preview
    ConfirmationMailer.sample_email(User.first)
  end
end
