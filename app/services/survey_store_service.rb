class SurveyStoreService
  def initialize(hash)
    @hash = hash
  end

  def create_or_update
    Neo4j::Transaction.run do |tx|
      survey = Survey.find_by_id(@hash['uuid']) || Survey.create
      survey.update_attributes(title: @hash['title'], subtitle: @hash['subtitle'])
      @hash['questions'].map do |q|
        question = Question.find_by_id(q['uuid']) || Question.create
        question.update_attributes(text: q['text'])
        q['answers'].each do |a|
          answer = Answer.find_by_id(a['uuid']) || Answer.create
          answer.update_attributes(text: a['text'])
          question.answers << answer
        end
        survey.questions << question
      end
    end
  end
end
