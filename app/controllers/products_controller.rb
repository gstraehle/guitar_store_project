class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    if user_signed_in?
      #finds the item numbers of current user's cart
      @in_cart = current_user.orders.find_by(processed_at: nil).order_products.pluck(:product_id).uniq.include?(@product.id)
      cart_id = current_user.orders.find_by(processed_at: nil)[:id]
      @in_cart ? @order_product_row = OrderProduct.where(order_id: cart_id).find_by(product_id: @product)[:id] : @order_product_row = 'n/a'
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def order_by_price
    @products = Product.all.sort(:price)
    @products
    redirect_to 'root_path'
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params[:product]
    end
end
