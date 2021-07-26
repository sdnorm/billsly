class AddPreferredContactMethodToClientProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :client_profiles, :preferred_contact_method, :bigint
  end
end
