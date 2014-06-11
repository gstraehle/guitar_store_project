class OrderProductsController < ApplicationController
  before_action :set_order_product, only: [:show, :edit, :destroy]#removed destroy

  def index
    @order_products = OrderProduct.all
  end

  def show
    @order_product = OrderProduct.find(params[:id])
  end

  def new
    @order_product = OrderProduct.new
  end

  def edit
  end

  def create
    @order_product = OrderProduct.new(order_product_params)

    if @order_product.save
      render json: @order_product, status: :created, location: @order_product
    else
      render json: @order_product.errors, status: :unprocessable_entity
    end
  end


  def update
    @order_product = Order.find(params[:id]).order_products.where(product_id: params[:order_product][:product_id]).first
    @order_product.quantity = params[:order_product][:quantity]
    @order_product.save
    # respond_to do |format|
    #   if @order_product.update(order_product_params)
    #     format.html { redirect_to @order_product, notice: 'Product was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @order_product }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @order_product.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @order_product.destroy

  end

  private
    def set_order_product
      @order_product = OrderProduct.find(params[:id])
    end

    def order_product_params
      params.require(:order_product).permit(:order_product_id, :order_id, :product_id, :user_id, :quantity, :unit_price, :processed_at, :id)
    end
end
