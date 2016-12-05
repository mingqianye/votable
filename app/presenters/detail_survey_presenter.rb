class DetailSurveyPresenter < SimpleSurveyPresenter
  def to_h
    super.merge({
      allow_comment: true,
      show_visual_type: 1,
      questions: questions
    })
  end

  private
  def questions
    @survey.questions.map{|q| QuestionPresenter.new(q).to_h}
  end
end
