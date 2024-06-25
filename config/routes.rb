Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Routes for language switching
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    # Define root path route ("/")
    root "homes#index"

    get 'quiz', to: 'questions#index'
    get 'result', to: 'questions#result'
    post 'questions/calculate_answer', to: 'questions#calculate_answer'

    get "/tests", to: "tests#index"
    resources :tests

    match '*path', to: 'errors#not_found', via: :all
  end

  get '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: { path: /(?!#{I18n.available_locales.join("|")})/ }

end
