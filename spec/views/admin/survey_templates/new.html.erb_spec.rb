require 'rails_helper'

RSpec.describe "admin/survey_templates/new", type: :view do
  before(:each) do
    assign(:admin_survey_template, Admin::SurveyTemplate.new())
  end

  it "renders new admin_survey_template form" do
    render

    assert_select "form[action=?][method=?]", admin_survey_templates_path, "post" do
    end
  end
end
