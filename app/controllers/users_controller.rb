class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    unless current_user.survey_completed
      redirect_to survey_path(1)
    end

    user_id = params[:id]
    if user_id.to_i != current_user.id
      redirect_to user_path(current_user)
    end
    @user = current_user
  end
end
