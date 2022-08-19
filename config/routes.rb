Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: %i[create index new show] do
      resources :comments, only: %i[create new]
      resources :likes, only: %i[create]
  end
end
