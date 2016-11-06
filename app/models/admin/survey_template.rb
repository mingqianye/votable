class Admin::SurveyTemplate
  include ActiveModel::Model

  attr_accessor :errors

  def initialize(json = nil)
    @errors = []
    @content = json
  end

  def content
    JSON.pretty_generate(@content || new_content)
  end

  private
  def new_content
    SurveySerializer.serialize(new_survey)
  end

  def new_survey
    q = Question.new(text: 'question 1 text')
    q.answers << Answer.new(text: 'answer A text')
    survey = Survey.new(title: 'Survey title', subtitle: 'Survey subtitle')
    survey.questions << q
    survey
  end
end
