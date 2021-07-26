class AddScaleToDollarAmountOnClientProfile < ActiveRecord::Migration[6.1]
  def change
    safety_assured { change_column :client_profiles, :dollar_amount, :decimal, precision: 10, scale: 2 }
  end
end
