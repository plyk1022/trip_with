Rails.application.routes.draw do
  
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'homes/top'
    resources :users, only:[:index,:show,:edit,:update]
  end
 
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    get 'users/unsubscribe', as: 'unsubscribe'
    patch 'users/withdraw', as: 'withdraw'
    resources :users, only:[:show,:edit,:update]
    
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
