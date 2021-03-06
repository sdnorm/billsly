require "administrate/base_dashboard"

class ClientDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    reminders: Field::HasMany,
    client_profiles: Field::HasMany,
    clients_provided_services: Field::HasMany,
    provided_services: Field::HasMany,
    account: Field::BelongsTo,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    first_name: Field::String,
    last_name: Field::String,
    email: Field::String,
    phone_number: Field::String,
    address1: Field::String,
    address2: Field::String,
    city: Field::String,
    state: Field::String,
    zip_code: Field::String,
    terms_and_conditions: Field::Boolean,
    preferred_contact_method: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  reminders
  client_profiles
  clients_provided_services
  provided_services
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  reminders
  client_profiles
  clients_provided_services
  provided_services
  account
  id
  created_at
  updated_at
  first_name
  last_name
  email
  phone_number
  address1
  address2
  city
  state
  zip_code
  terms_and_conditions
  preferred_contact_method
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  reminders
  client_profiles
  clients_provided_services
  provided_services
  account
  first_name
  last_name
  email
  phone_number
  address1
  address2
  city
  state
  zip_code
  terms_and_conditions
  preferred_contact_method
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how clients are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(client)
  #   "Client ##{client.id}"
  # end
end
