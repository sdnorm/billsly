class AddAccountReferenceToClient < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :clients, :account, index: {algorithm: :concurrently}
  end
end
