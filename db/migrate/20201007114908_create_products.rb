class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.float :price
      t.float :promotion_price
      t.datetime :top_hot
      t.text :description
      t.integer :amount, default: 1
      t.integer :brand_id
      t.integer :status
      t.timestamps
    end
  end
end
