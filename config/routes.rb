# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get '.well-known/apple-developer-merchantid-domain-association', to: 'apple_pays#show', as: :apple_pay
  draw :turbo

  # Jumpstart views
  if Rails.env.development? || Rails.env.test?
    mount Jumpstart::Engine, at: "/jumpstart"
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Administrate
  authenticated :user, lambda { |u| u.admin? } do
    namespace :admin do
      resources :reminders
      resources :completed_services
      resources :api_tokens
      resources :account_clients
      resources :client_profiles
      resources :sp_payment_links
      resources :clients
      if defined?(Sidekiq)
        require "sidekiq/web"
        mount Sidekiq::Web => "/sidekiq"
      end

      resources :announcements
      resources :users
      namespace :user do
        resources :connected_accounts
      end
      resources :accounts
      resources :account_users
      resources :plans  
      namespace :pay do
        resources :charges
        resources :subscriptions
      end
      root to: "dashboard#show"
    end
  end

  # API routes
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :auth
      resource :me, controller: :me
      resource :password
      resources :accounts
      resources :users
      resources :notification_tokens, only: :create
    end
  end

  # User account
  devise_for :users,
    controllers: {
      masquerades: "jumpstart/masquerades",
      omniauth_callbacks: "users/omniauth_callbacks",
      registrations: "users/registrations",
      sessions: "users/sessions"
    }
  devise_scope :user do
    get "session/otp", to: "sessions#otp"
  end

  resources :announcements, only: [:index]
  resources :api_tokens
  resources :accounts do
    member do
      patch :switch
    end

    resource :transfer, module: :accounts
    resources :account_users, path: :members
    resources :account_invitations, path: :invitations, module: :accounts
  end
  resources :account_invitations

  # Payments
  resource :card
  resource :subscription do
    patch :info
    patch :pause
    patch :resume
  end
  resources :charges

  namespace :account do
    resource :password
  end
  resources :notifications, only: [:index, :show]
  namespace :users do
    resources :mentions, only: [:index]
  end
  namespace :user, module: :users do
    resource :two_factor, controller: :two_factor do
      get :backup_codes
      get :verify
    end
    resources :connected_accounts
  end

  namespace :action_text do
    resources :embeds, only: [:create], constraints: {id: /[^\/]+/} do
      collection do
        get :patterns
      end
    end
  end

  scope controller: :static do
    get :about
    get :terms
    get :privacy
    get :pricing
    get :features
  end

  post :sudo, to: "users/sudo#create"

  match "/404", via: :all, to: "errors#not_found"
  match "/500", via: :all, to: "errors#internal_server_error"

  # link for SP to send a client to sign up
  # get ":id/client-sign-up", to: "customer#new_from_sp", as: :sp_specific_sign_up_form

  authenticated :user do
    # client dashboard
    root to: "clients#index", as: :user_root
    resources :clients do 
      resources :client_profiles
    end
    resources :reminders
    resources :sp_payment_links
    resources :completed_services
    post 'mark-job-complete', to: 'completed_services#create_from_dashboard', as: :completed_service_from_dash
    post 'mark-job-complete-client', to: "completed_services#create_from_client_show", as: :create_from_client_show
    get 'clients/:id/work-complete-index', to: 'clients#work_complete_index', as: :work_complete_index
    get 'clients/:id/send-initial-reminder', to: 'clients#initial_reminder', as: :initial_reminder
    post '/bulk_reminder_send', to: 'clients#bulk_reminder_send', as: :bulk_reminder_send
    patch 'clients/:id/client-message-index-update', to: 'clients#message_index_update', as: :message_index_update
    get 'clients/:id/revert_to_account_default_message', to: 'clients#revert_to_account_default_message', as: :revert_to_account_default_message
    get 'clients/:id/revert_to_last_specific_message', to: 'clients#revert_to_last_specific_message', as: :revert_to_last_specific_message
    post 'test/reminder/email', to: 'completed_services#test_reminder', as: :email_reminder_test

    get 'how_to', to: 'how_to#index', as: :how_to
    get 'how_to/get_venmo_link', to: 'how_to#get_venmo_link', as: :get_venmo_link
    get 'how_to/get_paypal_link', to: 'how_to#get_paypal_link', as: :get_paypal_link
  end

  get '/client_sign_up/:id/new', to: 'client_sign_up#index', as: :new_client_sign_up_link
  post '/client_sign_up/:id/new', to: 'client_sign_up#create', as: :client_sign_up_create

  # cookie consent
  post 'set_cookie_consent', to: 'static#set_cookie_consent', as: :set_cookie_consent

  # Public marketing homepage
  root to: "static#index"
end
