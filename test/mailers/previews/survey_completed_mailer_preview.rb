# Preview all emails at http://localhost:3000/rails/mailers/survey_completed_mailer
class SurveyCompletedMailerPreview < ActionMailer::Preview
  def welcome_email
    SurveyCompletedMailer.welcome_email(User.first)
  end
end
