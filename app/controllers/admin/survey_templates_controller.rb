class Admin::SurveyTemplatesController < ApplicationController
  before_action :set_admin_survey_template, only: [:edit, :update, :destroy]

  # GET /admin/survey_templates
  def index
    @surveys = Survey.all
  end

  # GET /admin/survey_templates/new
  def new
    @template = Admin::SurveyTemplate.new
  end

  # GET /admin/survey_templates/1/edit
  def edit
  end

  # POST /admin/survey_templates
  def create
    survey = SurveyStoreServie.new.store(admin_survey_template_params)
    @template = Admin::SurveyTemplate.new(survey)

    if @template.save
      redirect_to @template, notice: 'Survey template was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/survey_templates/1
  def update
    if @template.update(admin_survey_template_params)
      redirect_to @template, notice: 'Survey template was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/survey_templates/1
  def destroy
    @template.destroy
    redirect_to admin_survey_templates_url, notice: 'Survey template was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_survey_template
      survey = Survey.find(params[:id])
      @template = Admin::SurveyTemplate.new(survey)
    end

    # Only allow a trusted parameter "white list" through.
    def admin_survey_template_params
      params.fetch(:admin_survey_template, {})
    end
end
