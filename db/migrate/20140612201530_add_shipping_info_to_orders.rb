class AddShippingInfoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_to, :text
    add_column :orders, :shipping_address_1, :string
    add_column :orders, :shipping_address_2, :string
    add_column :orders, :shipping_city, :string
    add_column :orders, :shipping_state_abr, :string, :limit => 2
    add_column :orders, :shipping_zip, :string
  end
end
