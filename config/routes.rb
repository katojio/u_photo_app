Rails.application.routes.draw do
  root 'homes#index'

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  resources :photos, only: %i[index new create] do
    post :tweets
  end

  namespace :oauth do
    get :authorize
    get :callback
  end
end
