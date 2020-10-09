class EditTableBrands < ActiveRecord::Migration[6.0]
  def change
    change_column :brands, :status, :boolean, default: 1
  end
end
