Rails.application.routes.draw do
  resources :categories do
     resources :posts, except: [:index]
  end

  get 'categories' => 'home#index'

  get 'home/faq'

  get 'home/contact'

  root 'home#about'

end
