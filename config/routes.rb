Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  resources :users, only: [:index, :edit, :update, :show]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
end
