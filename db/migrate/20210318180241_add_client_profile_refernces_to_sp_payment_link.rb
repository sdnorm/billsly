class AddClientProfileReferncesToSpPaymentLink < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :sp_payment_links, :client_profile, index: {algorithm: :concurrently}
  end
end
