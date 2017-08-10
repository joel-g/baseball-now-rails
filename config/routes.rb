Rails.application.routes.draw do

  resources :players, only: [:index, :new, :create]

  get 'player_data' => 'players#player_data'

  root to: 'players#index'

end
