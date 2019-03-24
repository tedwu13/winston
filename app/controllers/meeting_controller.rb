class MeetingsController < ApplicationController
  # GET /meetings
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    @user = User.find_by id: params["user_id"]
  end


  # POST /meetings
  def create
    @meeting = Meeting.new meeting_params.merge(email: stripe_params["stripeEmail"],
                                                card_token: stripe_params["stripeToken"])
    raise "Please, check registration errors" unless @meeting.valid?
    @meeting.process_payment
    @meeting.save
    redirect_to @meeting, notice: 'Payment processing is successful'
  rescue
    flash[:error] = e.message
    render :new
  end

  private
    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end
    # white list params
    def meeting_params
      params.require(:meeting).permit(:course_id, :full_name, :company, :telephone)
    end
end
