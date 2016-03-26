class ChargesController < ApplicationController
def new
end

def create
  # Amount in cents
  @amount = 1000

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )
   
  @amt = @amount/100
  @payment = Payment.new(:user_id => current_user.id, :price => @amt, :pay_date => Date.today)
  @payment.save
  redirect_to users_path
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
end
