class AddFromReferralSlugToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :from_referral, :string
  end
end
