require "administrate/base_dashboard"

class ClientProfileDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    account: Field::BelongsTo,
    client: Field::BelongsTo,
    sp_payment_links: Field::HasMany,
    reminder_message: Field::RichText,
    id: Field::Number,
    reminder_message: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    payment_options: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  account
  client
  sp_payment_links
  reminder_message
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  account
  client
  sp_payment_links
  reminder_message
  id
  created_at
  updated_at
  payment_options
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  account
  client
  sp_payment_links
  reminder_message
  payment_options
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
