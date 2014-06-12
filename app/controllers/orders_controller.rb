class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @orders = current_user.orders
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @order_products = @order.order_products # returns an array
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = current_user.last_open_order
    if @order.products << Product.find(params[:order][:product_id])
      render json: @order.order_products
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:product_id, :quantity)
    end
end
