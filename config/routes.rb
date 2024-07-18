Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  get 'errors/unprocessable_content'
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :blogs, only: [:show]
    resources :scores, only: [:new, :create, :show]

    get "/blogs", to: "blogs#index"

    # Your routes here
    root "pages#index"

    get 'pages/translations'
    get 'pages/privacy_policy'
    get 'pages/about'
    get 'pages/faq'
    get 'pages/terms'

    match "/404", to: "errors#not_found", via: :all
    match "/500", to: "errors#internal_server_error", via: :all
    match "/422", to: "errors#unprocessable_content", via: :all

  end

  # Redirect root without locale to default locale
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root



end