class SurveyListService
  def initialize
  end

  def list
    surveys = LandingSurveysQuery.new.surveys
    surveys.map{|s| SurveyPresenter.new(s).to_hash}
  end
end
