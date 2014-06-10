class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @orders = Order.all#needed to derive most recent order/user

    order_products = OrderProduct.all

    if current_user.orders.find_by(processed_at: nil)
    @user_cart_has_item = current_user.orders.find_by(processed_at: nil).order_products.pluck(:product_id).uniq
    else
    @user_cart_has_item = []
    end


    @user_cart_has_item.include?(@product.id) ? @use_put = true : @use_put = false

    @check = order_products.find_by(product_id: @product.id)[:id]
    if @orders.where(user_id: current_user.id).find_by(processed_at: nil)
      @create_new_order_id = false#instructs counter click not to make new order
      @next_order = @orders.where(user_id: current_user.id).find_by(processed_at: nil)[:id]
    else
      @create_new_order_id = true#instructs counter click to make new order
      @next_order = @orders.last.id + 1
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
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

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
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

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params[:product]
    end
end
