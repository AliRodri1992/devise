Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :destroy,:edit,:update] do

  end

  root 'home#index'
end
