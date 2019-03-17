class AvailabilitiesController < ApplicationController
  SUNDAY_AFTER_EPOCH = Time.at(259200)

  # POST /availabilities
  def create
    new_availability = params[:new_availability]
    new_availability_day = new_availability.split('-')[0].to_i
    new_availability_hour = new_availability.split('-')[1].to_i

    new_availability_datetime = SUNDAY_AFTER_EPOCH + new_availability_day.days + new_availability_hour.hours

    current_user.availabilities << Availability.new(available_at: new_availability_datetime)

    head 200
    return
  end

  # DELETE /availabilities
  def destroy
    new_availability = params[:new_availability]
    new_availability_day = new_availability.split('-')[0].to_i
    new_availability_hour = new_availability.split('-')[1].to_i

    new_availability_datetime = SUNDAY_AFTER_EPOCH + new_availability_day.days + new_availability_hour.hours

    availability_to_delete = Availability.where(user: current_user, available_at: new_availability_datetime)

    Availability.destroy(availability_to_delete)

    head 200
    return
  end
end