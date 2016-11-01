class SurveyStoreService
  def initialize(hash)
    @hash = hash
  end

  def create
    Neo4j::Transaction.run do |tx|
      survey = SurveyDeserializer.survey(@hash)
      survey.save
      @hash['questions'].map do |q|
        question = SurveyDeserializer.question(q)
        question.save
        q['answers'].each do |a|
          answer = SurveyDeserializer.answer(a)
          answer.save
          question.answers << answer
        end
        survey.questions << question
      end
    end
  end

  def update
    Neo4j::Transaction.run do |tx|
      survey = Survey.find(@hash['uuid'])
      survey.update_attributes(title: @hash['title'])
      @hash['questions'].map do |q|
        question = Question.find(q['uuid'])
        question.update_attributes(text: @hash['text'])
        q['answers'].each do |a|
          answer = Answer.find(a['uuid'])
          answer.update_attributes(text: a['text'])
          question.answers << answer
        end
        survey.questions << question
      end
    end
  end
end
