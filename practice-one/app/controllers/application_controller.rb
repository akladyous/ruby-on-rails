class ApplicationController < ActionController::Base
  before_action :current_user

  private
  def current_user
    User.find_by(id: 1)
  end




  helper_method :current_user
end
