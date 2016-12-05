class AnswerPresenter
  def initialize(answer)
    @answer = answer
  end

  def to_h
    {
      id: @answer.id,
      text: @answer.text,
      label: @answer.label
    }
  end
end
