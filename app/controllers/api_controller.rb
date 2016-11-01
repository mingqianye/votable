class ApiController < ApplicationController
  def landing
    render json: ResponseFactory.build({})
  end

  def show_survey
    render json: ResponseFactory.build({})
  end

  def submit_vote
    render json: ResponseFactory.build({})
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
