class DisplaySurveyService
  def initialize(survey_id)
    @survey = Survey.find_by_id(survey_id)
  end

  def display
    DetailSurveyPresenter.new(@survey).to_h
  end
end
