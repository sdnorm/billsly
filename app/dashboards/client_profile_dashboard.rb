require "administrate/base_dashboard"

class ClientProfileDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    client: Field::BelongsTo,
    reminder_message: Field::RichText,
    id: Field::Number,
    reminder_message: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    payment_options: Field::Number,
    payment_option: Field::Number,
    last_reminder_message: Field::Text,
    dollar_amount_in_cents: Field::Number,
    dollar_amount: Field::String.with_options(searchable: false),
    address1: Field::String,
    address2: Field::String,
    city: Field::String,
    state: Field::String,
    zip_code: Field::String,
    preferred_contact_method: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  client
  reminder_message
  id
  reminder_message
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  client
  reminder_message
  id
  reminder_message
  created_at
  updated_at
  payment_options
  payment_option
  last_reminder_message
  dollar_amount_in_cents
  dollar_amount
  address1
  address2
  city
  state
  zip_code
  preferred_contact_method
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  client
  reminder_message
  reminder_message
  payment_options
  payment_option
  last_reminder_message
  dollar_amount_in_cents
  dollar_amount
  address1
  address2
  city
  state
  zip_code
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

  # Overwrite this method to customize how client profiles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(client_profile)
  #   "ClientProfile ##{client_profile.id}"
  # end
end
