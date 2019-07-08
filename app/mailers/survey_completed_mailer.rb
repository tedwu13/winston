class SurveyCompletedMailer < ApplicationMailer
  default from: 'notifications@winston.com'

  def welcome_email(user)
    attachments.inline["choodry.png"] = File.read("#{Rails.root}/app/assets/images/choodry.png")
    @user = user
    @concierge_name = ['Sida Wu', 'Ted Lu', 'Michael Hsu', 'Michelle Wang'].sample
    mail(to: @user.email, subject: "#{@user.first_name}, welcome to Winston!")
  end
end
