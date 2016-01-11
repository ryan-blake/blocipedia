class ChargesController < ApplicationController

  def create

    # creates a Stripe Customer object association w/ charge
    customer = Stripe::Customer.create!(
       email: current_user.email,
       card: params[:stripeToken]
    )

    # magic happening
    charge = Stripe::Charge.create(
      customer: customer_id, #Not the user_id in app
      amount: Amount.default,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thanks for the moneys, #{current_user.name}!"
    redirect_to user_path(current_user) #or wherever..

  # Stripe cardError message for when things go wrong.
  # this 'rescue block' catches and displays those errors.
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path

  end

  def new

    @stripe_btn_data = {
      key: "#{Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{Current_user.name}",
      amount: Amount.default
    }
  end
end
