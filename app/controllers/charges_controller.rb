class ChargesController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @order_products = @order.order_products
    @email = email_placeholder.to_s
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

    @date = Time.now
    @order = Order.find(params[:order_id])
    @order.processed_at = @date
    @order.save
    @order.order_products.each do |order_product|
      price = Product.find(order_product.product_id).price
      order_product.unit_price = price
      order_product.save
    end


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
