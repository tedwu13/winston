class ChargesController < ApplicationController
  CHARGE_AMOUNT_IN_DOLLARS = 100

  def new
    @amount = CHARGE_AMOUNT_IN_DOLLARS
  end

  def create
    @amount = CHARGE_AMOUNT_IN_DOLLARS

    # Create the customer in Stripe
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: params[:stripeToken]
    )

    # Create the charge using the customer data returned by Stripe API
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount * 100, # Stripe amount unit is in cents so times 100 to convert to dollar amount
      description: 'Rails Stripe Customer returned by Stripe API',
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
    flash[:notice] = "Please try again"
  end
end
