class User < ActiveRecord::Base
STATES = ['AK','AL','AR','AS','AZ','CA','CO','CT','DC','DE','FL','GA','GU','HI','IA','ID',

'IL','IN','KS','KY','LA','MA','MD','ME','MH','MI','MN','MO','MS','MT','NC','ND','NE','NH','NJ','NM','NV','NY',

'OH','OK','OR','PA','PR','PW','RI','SC','SD','TN','TX','UT','VA','VI','VT','WA','WI','WV','WY']

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  after_create :setup_cart

  def last_open_order
    self.orders.where(processed_at: nil).last
  end

  def current_cart_items
    self.orders.find_by(processed_at: nil).order_products
  end

  def setup_cart
    Order.create(user: self)
  end

  def product_in_cart?(product_id)
    self.orders.find_by(processed_at: nil).order_products.pluck(:product_id).uniq.include?(product_id)
  end

  def order_product_row(in_cart, product)
    cart_id = self.last_open_order()[:id]
    if in_cart
      return OrderProduct.where(order_id: cart_id).find_by(product_id: product)[:id]
    else
      return 'n/a'
    end
  end
end
