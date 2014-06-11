class AddDefaultQuantityToOrderProducts < ActiveRecord::Migration
  def up
    change_column :order_products, :quantity, :integer, default: 1
  end

  def down
    change_column :order_products, :quantity, :integer
  end
end
