Rails.application.routes.draw do

  resources :players, only: [:index, :new, :create, :show, :update]

  get 'player_data' => 'players#player_data'

  root to: 'players#index'

end
