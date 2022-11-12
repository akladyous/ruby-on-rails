class ErrorsController < ApplicationController
  def show
    @exception = request.env["action_dispatch.exception"]
    @status_code = ActionDispatch::ExceptionWrapper.status_code_for_exception(@exception.class.name)
    respond_to do |format|
      # format.html { render file: "#{Rails.root}/public/#{request.path[1..-1]}.html" #, template: false }
      format.html { render action: "#{request.path[1..-1]}" } #, template: false }
    end
  end

  private
  def view_for_status_code(statuscode)
    "#{Rails.root}/public/#{request.path[1..-1]}.html"
  end
end
