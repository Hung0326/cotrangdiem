class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.boolean :status
      t.timestamps
    end
  end
end
