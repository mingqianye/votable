require 'rails_helper'

RSpec.describe "admin/survey_templates/edit", type: :view do
  before(:each) do
    @admin_survey_template = assign(:admin_survey_template, Admin::SurveyTemplate.create!())
  end

  it "renders the edit admin_survey_template form" do
    render

    assert_select "form[action=?][method=?]", admin_survey_template_path(@admin_survey_template), "post" do
    end
  end
end
