class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  after_create :setup_cart

  def last_open_order
    self.orders.where(processed_at: nil).last
  end

  def setup_cart
    Order.create(user: self)
  end

end
