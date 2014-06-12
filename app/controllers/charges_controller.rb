class ChargesController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @order_products = @order.order_products
    @email = email_placeholder.to_s

    if @order.valid_for_checkout? == true

    else
      flash[:notice] = "Please add at least one item to your cart before proceeding to checkout."
      redirect_to :back
    end
  end

  def create
    # Amount in cents
    @amount = Order.find(params[:order_id]).total_in_pennies

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    @order = Order.find(params[:order_id])
    @order.checkout(charge.id)
    current_user.setup_cart

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  private
    def email_placeholder
      if user_signed_in?
        current_user.email
      end
    end
end
