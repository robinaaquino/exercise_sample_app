Rails.application.routes.draw do
  get 'users/new'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'

  resources :users #adds restful routes, pg.383

  root "static_pages#home"
end
