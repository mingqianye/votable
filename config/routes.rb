Rails.application.routes.draw do
  namespace :admin do
    resources :survey_templates
    #get 'survey_templates'
    #get 'survey_templates/new' => 'survey_templates#new'
    #get 'survey_templates' => 'survey_templates#index'
    get '/', to: 'survey_templates#index'
  end

  namespace 'api' do
    get 'landing'
    get 'show_survey'
    get 'submit_vote'
  end

  root to: 'landing#index'
end
