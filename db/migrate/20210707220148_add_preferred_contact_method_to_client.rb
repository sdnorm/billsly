class AddPreferredContactMethodToClient < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :preferred_contact_method, :bigint
  end
end
