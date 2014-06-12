class ApplicationController < ActionController::Base
  before_filter :current_user_order_products

  def default_serializer_options
    {root: false}
  end

  protect_from_forgery with: :exception

  def current_user_order_products
    @current_user_order_products = if user_signed_in?
      current_user.current_cart_items
    else
      []
    end
  end
end
