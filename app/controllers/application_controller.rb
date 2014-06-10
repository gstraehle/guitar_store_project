class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart, only: [:show, :index]

  def set_cart
    if user_signed_in?
      @cart = Order.where(user_id: current_user.id).find_by(processed_at: nil)
    end
  end
end
