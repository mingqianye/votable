class SurveyDeserializer
  def self.survey(hash)
    Survey.new(
      title: hash['title']
    )
  end

  def self.question(hash)
    Question.new(
      text: hash['text'],
    )
  end

  def self.answer(hash)
    Answer.new(
      text: hash['text']
    )
  end
end
