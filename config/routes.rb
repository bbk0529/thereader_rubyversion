Rails.application.routes.draw do
  root 'reader#index'
  get 'reader/index'

  get 'reader/detail'

  get 'reader/insert'

  get 'reader/searchdata'

  get 'reader/summary'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
