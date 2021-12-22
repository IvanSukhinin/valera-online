Rails.application.routes.draw do
  root 'intro#index'
  get 'valera' => 'valera#index'
end
