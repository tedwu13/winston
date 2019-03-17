class RegistrationController < ApplicationController
  def create
      @registration = Registration.new registration_params.merge(email: stripe_params["stripeEmail"],
                                                                 card_token: stripe_params["stripeToken"])
      raise "Please, check registration errors" unless @registration.valid?
      @registration.process_payment
      @registration.save
      redirect_to @registration, notice: 'Registration was successfully created.'
    rescue e
      flash[:error] = e.message
      render :new
    end

    private

    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end

    def process_payment
      customer = Stripe::Customer.create email: email,
                                         card: card_token

      Stripe::Charge.create customer: customer.id,
                            amount: course.price * 100,
                            description: course.name,
                            currency: 'usd'

    end

end
