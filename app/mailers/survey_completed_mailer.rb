class SurveyCompletedMailer < ApplicationMailer
  default from: 'hello@mail.askwinston.org'

  def welcome_email(user)
    attachments.inline["joyce.png"] = File.read("#{Rails.root}/app/assets/images/joyce.png")
    attachments.inline["nel.png"] = File.read("#{Rails.root}/app/assets/images/nel.png")
    attachments.inline["vanessa.png"] = File.read("#{Rails.root}/app/assets/images/vanessa.png")
    attachments.inline["email_background.png"] = File.read("#{Rails.root}/app/assets/images/email_background.jpg")
    attachments.inline["winston_logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
    @user = user
    @concierge_name = 'Casper Sermsuksan'
    mail(to: @user.email, subject: "#{@user.first_name}, welcome to Winston!")
  end
end
