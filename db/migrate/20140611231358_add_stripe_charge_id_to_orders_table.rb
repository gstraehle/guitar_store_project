class AddStripeChargeIdToOrdersTable < ActiveRecord::Migration
  def change
    add_column :orders, :stripe_charge_id, :string
  end
end
