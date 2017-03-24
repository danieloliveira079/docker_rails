Rails.application.routes.draw do
  resources :articles

  get 'redis', to: 'redis#index'

  root 'welcome#index'
end
