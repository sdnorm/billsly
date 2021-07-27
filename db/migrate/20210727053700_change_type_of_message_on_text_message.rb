class ChangeTypeOfMessageOnTextMessage < ActiveRecord::Migration[6.1]
  def change
    safety_assured {remove_column :text_messages, :type_of_message}
  end
end
