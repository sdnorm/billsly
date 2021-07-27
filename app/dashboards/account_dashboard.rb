require "administrate/base_dashboard"

class AccountDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    charges: Field::HasMany,
    subscriptions: Field::HasMany,
    owner: Field::BelongsTo,
    account_invitations: Field::HasMany,
    account_users: Field::HasMany,
    notifications: Field::HasMany,
    users: Field::HasMany,
    clients: Field::HasMany,
    sp_payment_links: Field::HasMany,
    reminders: Field::HasMany,
    completed_services: Field::HasMany,
    avatar_attachment: Field::HasOne,
    avatar_blob: Field::HasOne,
    default_reminder_message: Field::RichText,
    id: Field::Number,
    name: Field::String,
    personal: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    processor: Field::String,
    processor_id: Field::String,
    trial_ends_at: Field::DateTime,
    card_type: Field::String,
    card_last4: Field::String,
    card_exp_month: Field::String,
    card_exp_year: Field::String,
    extra_billing_info: Field::Text,
    domain: Field::String,
    subdomain: Field::String,
    default_reminder_message: Field::Text,
    slug: Field::String,
    plan: Field::String,
    quantity: Field::Number,
    card_token: Field::String,
    pay_fake_processor_allowed: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  charges
  subscriptions
  owner
  account_invitations
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  charges
  subscriptions
  owner
  account_invitations
  account_users
  notifications
  users
  clients
  sp_payment_links
  reminders
  completed_services
  avatar_attachment
  avatar_blob
  default_reminder_message
  id
  name
  personal
  created_at
  updated_at
  processor
  processor_id
  trial_ends_at
  card_type
  card_last4
  card_exp_month
  card_exp_year
  extra_billing_info
  domain
  subdomain
  default_reminder_message
  slug
  plan
  quantity
  card_token
  pay_fake_processor_allowed
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  charges
  subscriptions
  owner
  account_invitations
  account_users
  notifications
  users
  clients
  sp_payment_links
  reminders
  completed_services
  avatar_attachment
  avatar_blob
  default_reminder_message
  name
  personal
  processor
  processor_id
  trial_ends_at
  card_type
  card_last4
  card_exp_month
  card_exp_year
  extra_billing_info
  domain
  subdomain
  default_reminder_message
  slug
  plan
  quantity
  card_token
  pay_fake_processor_allowed
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

  # Overwrite this method to customize how accounts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(account)
  #   "Account ##{account.id}"
  # end
end
