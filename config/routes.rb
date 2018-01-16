Rails.application.routes.draw do
  root to: 'microposts#index'
  resources :microposts do
    collection do
      post :confirm
    end
  end
end
