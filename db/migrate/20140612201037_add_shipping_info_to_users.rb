class AddShippingInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :shipping_address_1, :string
    add_column :users, :shipping_address_2, :string
    add_column :users, :shipping_city, :string
    add_column :users, :shipping_state_abr, :string, :limit => 2
    add_column :users, :shipping_zip, :string
  end
end
