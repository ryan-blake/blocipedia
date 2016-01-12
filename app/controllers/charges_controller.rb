class ChargesController < ApplicationController

  def create

    # creates a Stripe Customer object association w/ charge
    customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
    customer: customer.id, # Note -- this is NOT the user_id in your app
    amount: 10_00,
    description: "BigMoney Membership - #{current_user.email}",
    currency: 'usd'
    )

    flash[:notice] = "Thanks for the moneys, #{current_user.name}!"

    current_user.premium!
    redirect_to root_path(current_user) #or wherever..

    # Stripe cardError message for when things go wrong.
    # this 'rescue block' catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end

  def new

    @stripe_btn_data = {
      key: "#{Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.name}",
      amount: 10_00
    }
  end

  def downgrade

    @user = User.find_by_id(params[:id])
    @wiki = current_user.wikis.find_by_id(params[:ids])

    flash[:notice] = "All private wikis are now public #{current_user.name}!"
    @stripe_btn_down = {
      key: "#{Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.name}",
      amount: -10_00
    }
    current_user.update_attributes ({ :role => 0 })

    current_user.wikis.each do |w|
      if w.private
        w.update_attributes(private: false)
      end
    end



    redirect_to root_path
  end
end
