class ApiController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def landing
    list = SurveyListService.new.list
    render json: ResponseFactory.build({ surveys: list })
  end

  def show_survey
    survey_detail = DisplaySurveyService.new(params[:survey_id]).display
    render json: ResponseFactory.build({ survey: survey_detail })
  end

  def submit_vote
    result = VoteService.new(params).result
    render json: ResponseFactory.build({ result: result })
  end

  private

  rescue_from StandardError do |exception|
    resp = {
      message: exception.message,
      backtrace: exception.backtrace
    }
    render json: ResponseFactory.build(resp, 'error')
  end
end
