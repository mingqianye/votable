class Admin::SurveyTemplatesController < ApplicationController
  before_action :set_admin_survey_template, only: [:edit, :update, :destroy]

  # GET /admin/survey_templates
  def index
    @dashboard = Admin::Dashboard.new
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
    survey_hash = JSON.parse(survey_params)
    @template = Admin::SurveyTemplate.new(survey_params)

    if SurveyStoreService.new(survey_hash).create_or_update
      redirect_to admin_survey_templates_url, notice: 'Survey template was successfully created.'
    else
      @template.errors << 'Unable to store survey'
      render :new
    end
  end

  # PATCH/PUT /admin/survey_templates/1
  def update
    survey_hash = JSON.parse(survey_params)
    @template = Admin::SurveyTemplate.new(survey_params)
    if SurveyStoreService.new(survey_hash).create_or_update
      redirect_to admin_survey_templates_url, notice: 'Survey template was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/survey_templates/1
  def destroy
    Survey.find(params[:id]).destroy
    redirect_to admin_survey_templates_url, notice: 'Survey template was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_survey_template
      survey = Survey.find(params[:id])
      hash = SurveySerializer.serialize(survey)
      @template = Admin::SurveyTemplate.new(hash)
    end

    # Only allow a trusted parameter "white list" through.
    def survey_params
      params.fetch(:survey, {})
    end
end
