Rails.application.routes.draw do
  root to: 'landing#index'
  namespace :admin do
    get '/', to: 'dashboard#index'
  end
end
