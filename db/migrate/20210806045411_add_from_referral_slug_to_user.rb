class AddFromReferralSlugToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :from_referral, :string
  end
end
