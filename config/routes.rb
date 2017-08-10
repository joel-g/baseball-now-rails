Rails.application.routes.draw do

  resources :players, only: [:index, :new, :create]

  

  root to: 'players#index'

end
