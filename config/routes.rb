# Route prefixes use a single letter to allow for vanity urls of two or more characters
Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  if defined? Sidekiq
    require 'sidekiq/web'
    authenticate :user, lambda {|u| u.is_admin? } do
      mount Sidekiq::Web, at: '/admin/sidekiq/jobs', as: :sidekiq
    end
  end

	mount Crono::Web, at: '/crono'

	#Shrine uploader endpoints
  mount AvatarUploader::UploadEndpoint, at: "/attachments/avatars"
  mount DocUploader::UploadEndpoint, at: "/attachments/docs"

  # Static pages
  match '/error' => 'pages#error', via: [:get, :post], as: 'error_page'
  get '/terms' => 'pages#terms', as: 'terms'
  get '/about' => 'pages#about', as: 'about'
  get '/adds' => 'pages#adds', as: 'adds'
  get '/privacy' => 'pages#privacy', as: 'privacy'
  # get '/opportunity' => 'pages#opportunity', as: 'opportunity'
  # get '/opportunity_index' => 'pages#opportunity_index', as: 'opportunity_index'
	get "/feed" => "activities#feed", as: :feed
  resources :opportunities do
    resources :follow_opportunities, :only => [:create, :destroy]
    resources :likes, only: [:create, :destroy]
		collection do
			get :following
			get :user_recommended
		end
		member do
			post :recommend
			post :destroy_recommendation
			get :export_opportunity
		end
  end

	resources :comments

  resources :contacts, only: [:new, :create]

  # OAuth
  oauth_prefix = Rails.application.config.auth.omniauth.path_prefix
  get "#{oauth_prefix}/:provider/callback" => 'users/oauth#create'
  get "#{oauth_prefix}/failure" => 'users/oauth#failure'
  get "#{oauth_prefix}/:provider" => 'users/oauth#passthru', as: 'provider_auth'
  get oauth_prefix => redirect("#{oauth_prefix}/login")

  # Devise
  devise_prefix = Rails.application.config.auth.devise.path_prefix
  devise_for :users, path: devise_prefix,
    controllers: {registrations: 'users/registrations', sessions: 'users/sessions',
      passwords: 'users/passwords', confirmations: 'users/confirmations', unlocks: 'users/unlocks'},
    path_names: {sign_up: 'signup', sign_in: 'login', sign_out: 'logout'}
  devise_scope :user do
		authenticated :user do
			delete "logout" => "devise/sessions#destroy", :as => "logout"
			root to: 'activities#feed', as: :authenticated_root
		end
		unauthenticated do
			root 'users/registrations#new'
		end
    get "#{devise_prefix}/after" => 'users/registrations#after_auth', as: 'user_root'
		get '/preferences' => 'users/registrations#user_preferences', as: 'user_preferences'
		get '/profile' => 'users/registrations#user_profile', as: 'user_profile'
  end
  get devise_prefix => redirect('/a/signup')


  # User
  resources :users, path: 'u', only: :show do
    resources :authentications, path: 'accounts'
  end
  get '/home' => 'users#show', as: 'user_home'


  # Dummy preview pages for testing.
  get '/p/test' => 'pages#test', as: 'test'
  get '/p/email' => 'pages#email' if ENV['ALLOW_EMAIL_PREVIEW'].present?

  get 'robots.:format' => 'robots#index'

end
