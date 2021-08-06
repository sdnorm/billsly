class AddReferralsCountedToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :referrals_counted, :bigint
  end
end
