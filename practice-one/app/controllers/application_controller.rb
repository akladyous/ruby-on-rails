class ApplicationController < ActionController::Base
  before_action :current_user

  private
  def current_user
    User.first
  end




  helper_method :current_user
end
