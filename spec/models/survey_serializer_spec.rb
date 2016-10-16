require "rails_helper"

RSpec.describe SurveySerializer do
  let(:survey) { build(:survey) }
  it 'serialize the survey object' do
    expect(SurveySerializer.serialize(survey)).to eq({
      'uuid'  => 'survey1',
      'title' => 'my survey title',
      'questions' => [{
        'uuid' => 'question1',
        'text' => 'my question text',
        'answers' => [{
          'uuid' => 'answer1',
          'text'  => 'my answer text'
        }],
      }]
    })
  end
end
