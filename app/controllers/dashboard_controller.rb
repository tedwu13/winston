class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    if expert_signed_in?
      redirect_to connected_path
    end
    unless current_user.survey_completed
      redirect_to survey_path(1)
    end
  end
end
