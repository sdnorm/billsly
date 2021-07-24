class AddTypeOfMessageToTextMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :text_messages, :type_of_message, :bigint, array: true
  end
end
