class CreateCustomerProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_profiles do |t|
      t.references :account, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.text :reminder_message

      t.timestamps
    end
  end
end
