class RemoveNullContraintOfAccountOnClientProfile < ActiveRecord::Migration[6.1]
  def change
    safety_assured { remove_reference :client_profiles, :account, index: true, foreign_key: true }
  end
end
