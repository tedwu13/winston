class SchedulerController < ApplicationController
  # GET /scheduler
  def index
    @daynames = Date::DAYNAMES
    @hour_intervals = [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    @hour_to_time_map = {
        0 => '12:00 AM',
        1 => '1:00 AM',
        2 => '2:00 AM',
        3 => '3:00 AM',
        4 => '4:00 AM',
        5 => '5:00 AM',
        6 => '6:00 AM',
        7 => '7:00 AM',
        8 => '8:00 AM',
        9 => '9:00 AM',
        10 => '10:00 AM',
        11 => '11:00 AM',
        12 => '12:00 PM',
        13 => '1:00 PM',
        14 => '2:00 PM',
        15 => '3:00 PM',
        16 => '4:00 PM',
        17 => '5:00 PM',
        18 => '6:00 PM',
        19 => '7:00 PM',
        20 => '8:00 PM',
        21 => '9:00 PM',
        22 => '10:00 PM',
        23 => '11:00 PM',
    }
    @availabilities = Set['0-0', '1-2', '5-9', '6-23']
    render 'index'
  end
end
