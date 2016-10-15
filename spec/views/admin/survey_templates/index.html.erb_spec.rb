require 'rails_helper'

RSpec.describe "admin/survey_templates/index", type: :view do
  before(:each) do
    assign(:admin_survey_templates, [
      Admin::SurveyTemplate.create!(),
      Admin::SurveyTemplate.create!()
    ])
  end

  it "renders a list of admin/survey_templates" do
    render
  end
end
