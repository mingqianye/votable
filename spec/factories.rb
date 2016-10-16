FactoryGirl.define do
  sequence :uuid do |n|
    "uuid_#{n}"
  end

  factory :survey do
    title "my survey title"
    after :build do |survey|
      allow(survey).to receive(:uuid) { 'survey1' }
      allow(survey).to receive(:questions) { [build(:question)] }
    end
  end

  factory :question do
    text "my question text"
    after :build do |question|
      allow(question).to receive(:uuid) { 'question1' }
      allow(question).to receive(:answers) { [build(:answer)] }
    end
  end

  factory :answer do
    label "A"
    text "my answer text"
    after :build do |answer|
      allow(answer).to receive(:uuid) { 'answer1' }
    end
  end
end
