class AddReferencesForAccountToClient < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!
  def change
    # add_reference :clients, :account, null: false, index: {algorithm: :concurrently}
  end
end
