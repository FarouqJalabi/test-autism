Rails.application.routes.draw do
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :blogs, only: [:show]

    get "/blogs", to: "blogs#index"

    # Your routes here
    root "static_pages#index"

    get "/test", to: "tests#show"

    get '/result', to: 'questions#result'
    post 'questions/calculate_answer', to: 'questions#calculate_answer'


    get 'static_pages/translations'
    get 'static_pages/privacy_policy'
    get 'static_pages/about'
    get 'static_pages/faq'

  end

  # Redirect root without locale to default locale
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

  match '*path', to: 'application#not_found!', via: :all


end