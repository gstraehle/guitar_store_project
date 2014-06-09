class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.datetime :processed_at
      t.integer :user_id
      t.timestamps
    end
  end
end
