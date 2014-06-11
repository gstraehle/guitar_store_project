class OrderProduct < ActiveRecord::Base
  # This is the relation between the order (cart) and the products (what you're buying)
  belongs_to :order
  belongs_to :product

  def subtotal
    quantity * unit_price
  end

end
