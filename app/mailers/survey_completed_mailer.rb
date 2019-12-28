class SurveyCompletedMailer < ApplicationMailer
  def welcome_email(user)
    attachments.inline["felisha.png"] = File.read("#{Rails.root}/app/assets/images/felisha.png")
    attachments.inline["ted.png"] = File.read("#{Rails.root}/app/assets/images/ted.png")
    attachments.inline["yash.png"] = File.read("#{Rails.root}/app/assets/images/yash.png")
    attachments.inline["email_background.png"] = File.read("#{Rails.root}/app/assets/images/email_background.jpg")
    attachments.inline["winston_logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
    @user = user
    @concierge_name = 'Casper Sermsuksan'
    mail(to: @user.email, from: 'Winston <hello@mail.askwinston.org>', subject: "#{@user.first_name}, welcome to Winston!")
  end
end
