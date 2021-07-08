class CreateTextMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :text_messages do |t|

      t.timestamps
    end
  end
end
