class Admin::SurveysController < ApplicationController
  def index
  end
  def new
    @survey = {}
  end

  def create
    render action: :index
  end
end
