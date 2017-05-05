Rails.application.routes.draw do
  resources :posts

  get 'topics' => 'home#index'

  get 'home/faq'

  get 'home/contact'

  root 'home#about'

end
