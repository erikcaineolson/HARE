Rails.application.routes.draw do
  get 'home/index'

  root "home#index"

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
