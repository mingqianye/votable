class AnswerPresenter
  def initialize(answer, total_votes)
    @answer = answer
    @total_votes = total_votes
  end

  def to_h
    {
      id: @answer.id,
      text: @answer.text,
      label: @answer.label,
      num_votes: num_votes,
      percent_votes: percent_votes
    }
  end
  private
  def num_votes
    @num_votes ||= @answer.voters.count
  end
  def percent_votes
    return nil if @total_votes == 0
    num_votes / @total_votes
  end
end
