class AddPaymentOptionsToClientProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :client_profiles, :payment_options, :bigint, array: true 
  end
end
