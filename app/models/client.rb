# == Schema Information
#
# Table name: clients
#
#  id           :bigint           not null, primary key
#  address1     :string
#  address2     :string
#  city         :string
#  email        :string
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  state        :string
#  zip_code     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Client < ApplicationRecord

  has_many :account_clients, dependent: :destroy
  has_many :accounts, through: :account_clients

  has_many :reminders

  has_many :client_profiles, dependent: :destroy
  accepts_nested_attributes_for :client_profiles, reject_if: :all_blank, allow_destroy: true

  include PgSearch::Model
  pg_search_scope :general_client_search, 
  against: [
    :first_name, 
    :last_name, 
    :email, 
    :address1
  ], 
  using: {
    tsearch: {prefix: true},
    dmetaphone: {},
    trigram: {}
  }

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_street_address
    if address2.nil?
      "#{address1}"
    else
      "#{address1} #{address2}"
    end
  end

  def city_state_zip
    "#{city}, #{state} #{zip_code}"
  end

  def send_initial_reminder(account, service_provider)
    WorkCompleteMailer.with(client: self, account: account, service_provider: service_provider).initial_reminder.deliver_later
    if self.client_profiles.first.reminder_message.blank?
      Reminder.create(message: account.default_reminder_message, client_id: self.id, account_id: account.id)
    else 
      Reminder.create(message: self.client_profiles.first.reminder_message, client_id: self.id, account_id: account.id)
    end
  end

  def last_reminder
    self.reminders.last
  end

  def set_last_reminder_message
    client_profile = self.client_profiles.first
    client_profile.update(last_reminder_message: client_profile.reminder_message)
  end

  def clear_out_reminder_message
    client_profile = self.client_profiles.first 
    client_profile.update(reminder_message: nil)
  end

end
