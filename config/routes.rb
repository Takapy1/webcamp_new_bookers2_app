Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'users/registrations' }
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  resources :users, only: [:index, :edit, :update, :show]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]

  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'

  post 'book_comment/:id' => 'book_comments#crate', as: 'create_book_comment'
  delete 'book_comment/:id' => 'book_comments#destroy', as: 'destroy_book_comment'
end
