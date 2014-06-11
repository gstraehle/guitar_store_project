class Order < ActiveRecord::Base
  # This is what we're buying today
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  def total
    self.order_products.pluck(:unit_price).sum.to_i
  end

  def total_in_pennies
    self.total * 100
  end

end
