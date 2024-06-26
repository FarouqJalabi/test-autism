Rails.application.routes.draw do
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    # Your routes here
    root "homes#index"
    # Example routes for questions and tests
    get 'quiz', to: 'questions#index'
    get 'result', to: 'questions#result'
    post 'questions/calculate_answer', to: 'questions#calculate_answer'

    get "tests/:id", to: "tests#index", as: :test
  end

  # Redirect root without locale to default locale
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root






end
