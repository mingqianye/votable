class Admin::SurveyTemplate
  include ActiveModel::Model

  attr_accessor :errors

  def initialize(json = nil)
    @errors = []
    @content = json
  end

  def content
    @content || new_content
  end

  private
  def new_content
    JSON.pretty_generate(new_survey)
  end

  def new_survey
    q = Question.new(text: 'question 1 text')
    q.answers << Answer.new(label: 'A', text: 'answer A text')
    survey = Survey.new(title: 'Survey title')
    survey.questions << q
    survey
  end
end
