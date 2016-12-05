class QuestionPresenter
  def initialize(question)
    @question = question
  end

  def to_h
    {
      id: @question.id,
      text: @question.text,
      answers: answers
    }
  end

  private
  def answers
    @question.answers.map{|a| AnswerPresenter.new(a, total_votes).to_h}
  end

  def total_votes
    @total_votes ||= @question.answers.voters.count
  end
end
