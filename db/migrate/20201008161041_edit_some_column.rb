class EditSomeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :image, :text
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
