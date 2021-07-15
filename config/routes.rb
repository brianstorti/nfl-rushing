Rails.application.routes.draw do
  resources :player_stats

  root "player_stats#index"
end
