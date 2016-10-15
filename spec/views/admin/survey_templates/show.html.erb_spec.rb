require 'rails_helper'

RSpec.describe "admin/survey_templates/show", type: :view do
  before(:each) do
    @admin_survey_template = assign(:admin_survey_template, Admin::SurveyTemplate.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
