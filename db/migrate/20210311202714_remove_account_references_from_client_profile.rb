class RemoveAccountReferencesFromClientProfile < ActiveRecord::Migration[6.1]
  def change
    safety_assured { remove_reference :client_profiles, :account }
  end
end
