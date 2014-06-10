class Product < ActiveRecord::Base
  # This is what you're buying
  has_many :order_products
  has_many :orders, through: :order_products
end
