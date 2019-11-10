class SurveyCompletedMailer < ApplicationMailer
  default from: 'hello@mail.askwinston.org'

  def welcome_email(user)
    attachments.inline["choodry.png"] = File.read("#{Rails.root}/app/assets/images/choodry.png")
    attachments.inline["email_background.png"] = File.read("#{Rails.root}/app/assets/images/email_background.jpg")
    attachments.inline["winston_logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
    @user = user
    @concierge_name = 'Casper Sermsuksan'
    mail(to: @user.email, subject: "#{@user.first_name}, welcome to Winston!")
  end
end
