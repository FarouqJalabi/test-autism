Rails.application.routes.draw do
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

  end

  # Redirect root without locale to default locale
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

  match '*path', to: 'application#not_found!', via: :all


end