class UpdatePaymentOptionColumnTypeOnClientProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :client_profiles, :payment_option, :bigint
  end
end
