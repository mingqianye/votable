class Admin::SurveysController < ApplicationController
  def index
  end
  def new
    @survey = Survey.new
  end

  def create
    render action: :index
  end
end
