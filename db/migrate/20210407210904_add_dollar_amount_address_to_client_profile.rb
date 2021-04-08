class AddDollarAmountAddressToClientProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :client_profiles, :dollar_amount_in_cents, :bigint
    add_column :client_profiles, :dollar_amount, :decimal
    add_column :client_profiles, :address1, :string
    add_column :client_profiles, :address2, :string
    add_column :client_profiles, :city, :string
    add_column :client_profiles, :state, :string
    add_column :client_profiles, :zip_code, :string
  end
end
