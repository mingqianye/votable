class Admin::DashboardController < ApplicationController
  #http_basic_authenticate_with name: 'admin', password: 'password'
  def index
    @dashboard = Dashboard.new
  end
end
