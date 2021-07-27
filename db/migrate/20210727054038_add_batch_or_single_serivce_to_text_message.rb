class AddBatchOrSingleSerivceToTextMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :text_messages, :batch_or_single_service, :bigint
  end
end
