# == Schema Information
#
# Table name: client_profiles
#
#  id               :bigint           not null, primary key
#  reminder_message :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  client_id        :bigint           not null
#
# Indexes
#
#  index_client_profiles_on_client_id  (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#
class ClientProfile < ApplicationRecord

  # belongs_to :account
  belongs_to :client
  
end
