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

  get 'home/faq'
  get 'home/contact'
  root 'home#about'

end
