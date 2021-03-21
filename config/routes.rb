Rails.application.routes.draw do
  get 'users/show'
 devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get  "home/about"  => "homes#about"

  resources :books
  resources :users
end