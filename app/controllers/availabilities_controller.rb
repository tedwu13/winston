class AvailabilitiesController < ApplicationController
  SUNDAY_AFTER_EPOCH = Time.at(259200).utc

  # POST /availabilities
  def create
    new_availability = params[:new_availability]
    new_availability_day = new_availability.split('-')[0].to_i
    new_availability_hour = new_availability.split('-')[1].to_i

    new_availability_datetime = SUNDAY_AFTER_EPOCH + new_availability_day.days + new_availability_hour.hours

    timezone_adjusted_availability = Time.new(
        new_availability_datetime.year,
        new_availability_datetime.month,
        new_availability_datetime.day,
        new_availability_datetime.hour,
        0,
        0,
        ActiveSupport::TimeZone[current_user.time_zone].formatted_offset).utc
    current_user.availabilities << Availability.new(available_at: timezone_adjusted_availability)

    head 200
    return
  end

  # DELETE /availabilities
  def destroy
    new_availability = params[:new_availability]
    new_availability_day = new_availability.split('-')[0].to_i
    new_availability_hour = new_availability.split('-')[1].to_i

    new_availability_datetime = SUNDAY_AFTER_EPOCH + new_availability_day.days + new_availability_hour.hours

    timezone_adjusted_availability = Time.new(
        new_availability_datetime.year,
        new_availability_datetime.month,
        new_availability_datetime.day,
        new_availability_datetime.hour,
        0,
        0,
        ActiveSupport::TimeZone[current_user.time_zone].formatted_offset).utc

    availability_to_delete = Availability.where(user: current_user, available_at: timezone_adjusted_availability)

    Availability.destroy(availability_to_delete)

    head 200
    return
  end
end