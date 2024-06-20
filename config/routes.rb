Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "homes#index"
  get 'quiz', to: 'questions#index'
  get 'result', to: 'questions#result'
  post 'questions/calculate_answer', to: 'questions#calculate_answer'

  get "/tests", to: "test#index"
  get "/tests/:id", to: "test#show"
end
