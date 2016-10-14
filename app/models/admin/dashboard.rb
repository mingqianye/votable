class Admin::Dashboard
  attr_reader :users, :surveys
  def initialize
    @users = User.count
    @surveys = Survey.count
  end
end
