class SurveyCompletedMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @concierge_name = 'Casper Sermsuksan'
    mail(to: @user.email, from: 'Winston <hello@mail.askwinston.org>', subject: "#{@user.first_name}, welcome to Winston!")
  end
end
