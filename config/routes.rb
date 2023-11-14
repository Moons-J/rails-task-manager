Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/tasks/new", to: "tasks#new", as: 'new'
  get "/tasks", to: "tasks#index"
  get "/tasks/:id", to: "tasks#show", as: 'task'
  post "/tasks", to: "tasks#create", as: 'create'
  delete "/tasks/:id", to: "tasks#destroy", as: 'destroy'
  get "/tasks/:id/edit", to: "tasks#edit", as: 'edit'
  patch "tasks/:id", to: "tasks#update", as: 'update'
  # Defines the root path route ("/")
  # root "posts#index"
end
