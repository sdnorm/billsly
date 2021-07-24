class AddColumnsToTextMessage < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_column :text_messages, :body, :text
    add_column :text_messages, :recipient_number, :string
    add_column :text_messages, :successfully_delivered, :boolean
    add_reference :text_messages, :client, null: false, index: {algorithm: :concurrently}
    add_reference :text_messages, :account, null: false, index: {algorithm: :concurrently}
  end
end
