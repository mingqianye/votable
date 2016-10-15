class Admin::SurveyTemplate
  include ActiveModel::Model

  attr_reader :errors

  def initialize(survey = nil)
    @errors = []
  end

  def content
    q = Question.new(text: 'question 1 text')
    q.answers << Answer.new(label: 'A', text: 'answer A text')
    survey = Survey.new(title: 'Survey title')
    survey.questions << q
    @content = JSON.pretty_generate(survey.to_hash)
  end


end
