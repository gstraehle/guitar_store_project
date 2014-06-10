class Order < ActiveRecord::Base
  # This is what we're buying today

  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

end
