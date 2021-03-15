class AccountClient < ApplicationRecord

  belongs_to :account
  belongs_to :customer

  has_many :reminders

end
