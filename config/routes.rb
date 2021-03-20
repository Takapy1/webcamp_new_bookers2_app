Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'users/registrations' }

  root to: "homes#top"
  get 'home/about' => 'homes#about'
  resources :users, only: [:index, :edit, :update, :show]

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
