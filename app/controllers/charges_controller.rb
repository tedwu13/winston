class ChargesController < ApplicationController
  CHARGE_AMOUNT_IN_DOLLARS = 100
  def new
    @amount = CHARGE_AMOUNT_IN_DOLLARS
  end

  def create
    # Amount is in cents so always times 100 for dollars
    @amount = CHARGE_AMOUNT_IN_DOLLARS * 100 # 10,000 cents is 100 dollars

    # Create the customer in Stripe
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: params[:stripeToken]
    )

    # Create the charge using the customer data returned by Stripe API
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'rails stripe customer returned by Stripe API',
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
    flash[:notice] = "Please try again"
  end
end
