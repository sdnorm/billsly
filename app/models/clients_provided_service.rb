class ClientsProvidedService < ApplicationRecord
  belongs_to :provided_service
  belongs_to :client
end
