class ChargesController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @order_products = @order.order_products
    @email = current_user.email

    unless @order.valid_for_checkout?
      flash[:notice] = "Please add at least one item to your cart before proceeding to checkout."
      redirect_to :back
    end
  end

  def create
    @order = Order.find(params[:order_id])
    @amount = @order.total_in_pennies

    customer = Stripe::Customer.create(
      email: 'example@stripe.com',
      card:  params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

    @order.checkout(charge.id)
    current_user.setup_cart

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
