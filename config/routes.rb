Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      post :downgrade
    end
  end
  
  resources :categories do
    resources :posts, except: [:index] 
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    post '/like' => 'likes#like', as: :like
    post '/unlike' => 'likes#unlike', as: :unlike
  end

  get 'home/faq'
  get 'home/contact'
  root 'home#about'

end
