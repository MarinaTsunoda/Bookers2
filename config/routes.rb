Rails.application.routes.draw do
  root to:"homes#top"
  get 'homes/about' => "homes#about", as:'about'
  resources:users, only:[:show, :index, :edit, :update, :create, :sign_in, :sign_up]
  resources:books, only:[:show, :index, :edit, :destroy, :update, :create]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
