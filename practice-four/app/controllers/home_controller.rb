class HomeController < ApplicationController
  def index
    flash[:alert] = "home page"
  end
end
