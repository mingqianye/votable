Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'dashboard#index'
  end
  root to: 'landing#index'
end
