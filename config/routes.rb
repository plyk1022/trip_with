Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :posts, only:[:show, :edit, :destroy]
    resources :users, only:[:index, :show, :update]
    resources :comments, only:[:index, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'search' => 'searches#search'
    get 'search_prefecture' => 'searches#search_prefecture'
    resources :users, only:[:show, :edit, :update]

    post 'posts/form' => 'posts#form', as: 'form'
    get 'favorites/index', as: 'favorites'
    
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
