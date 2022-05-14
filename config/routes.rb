Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/create'
  get 'lists/show'
  get 'lists/new'
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  resources :lists, only: [:create, :index, :show, :new] do
    resources :bookmarks, only: [:create, :new]
  end
  resources :bookmarks, only: [:destroy]
end
