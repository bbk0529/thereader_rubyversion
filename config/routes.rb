Rails.application.routes.draw do
  root 'reader#index'
  get 'reader/index'

  get 'reader/detail'

  get 'reader/insert'

  get 'reader/insert_email'

  get 'reader/searchdata'

  get 'reader/summary'

  get 'reader/multidetail'
  get 'reader/watson'


  get 'reader/import'
  get 'reader/readPI'
  resources :watson
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
