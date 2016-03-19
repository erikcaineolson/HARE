Rails.application.routes.draw do
  get 'listings/index'

  get 'listings/show'

  root "home#index"
	resources :listings

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
