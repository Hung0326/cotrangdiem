class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :level
      t.integer :position, null: false
      t.integer :dependent
      t.string :slug
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
