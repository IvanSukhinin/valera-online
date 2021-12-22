Rails.application.routes.draw do
  root 'intro#index'
  get 'new_game' => 'intro#new_game'
  get 'valera' => 'valera#index'
  patch 'valera', controller: 'valera', action: :index
end
