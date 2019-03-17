class AvailabilitiesController < ApplicationController
  # GET /users/1/availabilities
  def index
    if current_user != User.find(params[:user_id])
      head :forbidden
      return
    end

    availabilities = current_user.availabilities
    filtered_availabilities = availabilities.map do |availability|
      # TODO: do something here
    end

    render :json => ['0-0', '1-2', '5-9', '6-23']
  end
end