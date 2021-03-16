class CreateReceivePaymentLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :receive_payment_links do |t|
      t.bigint :name
      t.string :link
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
