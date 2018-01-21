Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :microposts do
    collection do
      post :confirm
    end
  end
end
