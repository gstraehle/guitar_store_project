class AddUniquenessConstraintToOrderProducts < ActiveRecord::Migration
  def change
    # This will allow each item to only be added to a cart once
    add_index :order_products, [:product_id, :order_id], unique: true
  end
end
