Rails.application.routes.draw do
  resources :users
  get  'api-docs' ,  to: 'api_docs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
