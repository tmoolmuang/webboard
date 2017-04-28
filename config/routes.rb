Rails.application.routes.draw do
  get 'home/index'

  get 'home/about'

  get 'home/faq'

  get 'home/contact'

  root 'home#about'

end
