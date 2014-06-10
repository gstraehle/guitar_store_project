class Order < ActiveRecord::Base
  belongs_to :user
  has_many :products, through: :order_products
  has_many :order_products

  def total
    totals = []
    self.order_products.each do |product|
      totals << product.subtotal
    end
    totals.sum
  end


end
