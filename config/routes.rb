Rails.application.routes.draw do

  resources :players

  get 'player_data' => 'players#player_data'

  root to: 'players#index'

end
