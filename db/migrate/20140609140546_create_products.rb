class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :model
      t.text :brand
      t.decimal :avg_rating, :precision => 2, :scale => 1
      t.text :description
      t.integer :quantity
      t.decimal :price, :precision => 10, :scale => 2
      t.decimal :msrp, :precision => 10, :scale => 2
      t.text :category
      t.text :image
      t.text :alt_image_1
      t.text :alt_image_2
      t.text :alt_image_3
      t.text :orientation
      t.text :series
      t.integer :year
      t.text :neck_wood
      t.text :bridge_type
      t.text :number_of_frets
      t.text :neck_type
      t.text :body_wood
      t.text :case_type
      t.text :tuning_machines
      t.timestamps
    end
  end
end
