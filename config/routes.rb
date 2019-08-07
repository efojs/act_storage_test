Rails.application.routes.draw do
  root to: 'application#index'

  get 'new', to: 'application#new', as: 'new_post'
  post 'create', to: 'application#create', as: 'create_post'
  delete 'destroy', to: 'application#destroy', as: 'destroy_post'

end
