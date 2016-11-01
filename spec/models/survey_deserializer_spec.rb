require "rails_helper"

RSpec.describe SurveyDeserializer do
  let(:survey_hash) do
    {
      'uuid'  => 'survey1',
      'title' => 'my survey title',
      'questions' => [question_hash]
    }
  end

  let(:question_hash) do
    {
      'uuid' => 'question1',
      'text' => 'my question text',
      'answers' => [answer_hash]
    }
  end

  let (:answer_hash) do
    {
      'uuid' => 'answer1',
      'text'  => 'my answer text'
    }
  end

  it 'deserialize the survey hash' do
    survey = SurveyDeserializer.survey(survey_hash)
    expect(survey.title).to eq('my survey title')


    question = SurveyDeserializer.question(question_hash)
    expect(question.text).to eq('my question text')

    answer = SurveyDeserializer.question(answer_hash)
    expect(answer.text).to eq('my answer text')
  end
end
