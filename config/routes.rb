Rails.application.routes.draw do
  root 'reader#index'
  get 'reader/index'

  get 'reader/detail'

  get 'reader/insert'

  post 'reader/insert_email'

  get 'reader/searchdata'

  get 'reader/summary'

  get 'reader/multidetail'
  post 'reader/watson'


  get 'reader/import'
  get 'reader/readPI'
  get 'reader/destroy/:id' => 'reader#destroy'
  #resources :watson
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
