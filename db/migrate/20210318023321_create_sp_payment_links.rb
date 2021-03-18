class CreateSpPaymentLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :sp_payment_links do |t|
      t.bigint :name
      t.string :link
      t.references :account

      t.timestamps
    end
  end
end
