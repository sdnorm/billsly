class AddColumnsToClient < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :phone_number, :string
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :address1, :string
    add_column :clients, :address2, :string
    add_column :clients, :city, :string
    add_column :clients, :state, :string
    add_column :clients, :zip_code, :string
  end
end
