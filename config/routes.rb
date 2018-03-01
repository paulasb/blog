Rails.application.routes.draw do
  devise_for :users
  #devise_for :users, controllers: {
  #  sessions: 'users/sessions'
  #}
  # get 'welcome/index'
  resources :articles do
  	 resources :comments
  end
  root 'welcome#index'
  # para ir para os posts quando clica na barra superior
  # root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
