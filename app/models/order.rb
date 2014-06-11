class Order < ActiveRecord::Base
  # This is what we're buying today
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  def total
    self.products.pluck(:price).sum.to_i
  end

  def total_in_pennies
    self.total * 100
  end

  # Updates processed_at column and sets unit_price on each line item
  # so future price increases do not impact the order history.
  def checkout(stripe_id)
    self.processed_at = Time.now
    self.stripe_charge_id = stripe_id
    self.save
    self.order_products.each do |order_product|
      order_product.unit_price = Product.find(order_product.product_id).price
      order_product.save
    end
  end
end
