Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlù
  get ('/') => redirect('appunti')
  devise_for :users, :controllers => {
    :omniauth_callbacks => "omniauth_callbacks"
  }
  resources :appunti
end