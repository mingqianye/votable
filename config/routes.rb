Rails.application.routes.draw do
  root to: 'landing#index'
  namespace :admin do
    resources :surveys
    get '/', to: 'dashboard#index'
  end
end
