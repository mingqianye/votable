Rails.application.routes.draw do
  namespace :admin do
    resources :survey_templates
    #get 'survey_templates'
    #get 'survey_templates/new' => 'survey_templates#new'
    #get 'survey_templates' => 'survey_templates#index'
    get '/', to: 'survey_templates#index'
  end

  get 'api/landing' => 'api#landing'
  get 'api/show_survey' => 'api#show_survey'
  get 'api/submit_vote' => 'api#submit_vote'

  root to: 'landing#index'
end
