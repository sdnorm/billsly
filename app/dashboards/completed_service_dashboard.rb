require "administrate/base_dashboard"

class CompletedServiceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    account: Field::BelongsTo,
    client_profile: Field::BelongsTo,
    reminder: Field::HasOne,
    id: Field::Number,
    provided_service_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    dollar_amount: Field::String.with_options(searchable: false),
    type_of_reminder: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  account
  client_profile
  reminder
  id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  account
  client_profile
  reminder
  id
  provided_service_id
  created_at
  updated_at
  dollar_amount
  type_of_reminder
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  account
  client_profile
  reminder
  provided_service_id
  dollar_amount
  type_of_reminder
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

  # Overwrite this method to customize how completed services are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(completed_service)
  #   "CompletedService ##{completed_service.id}"
  # end
end
