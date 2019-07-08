class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    unless current_user.survey_completed || expert_signed_in?
      redirect_to survey_path(1)
    end

    @user = current_user
  end
end
