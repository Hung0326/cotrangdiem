class CreateAdministrators < ActiveRecord::Migration[6.0]
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :phone
      t.datetime :birthday
      t.integer :role
      t.integer :status
      t.timestamps
    end
  end
end
