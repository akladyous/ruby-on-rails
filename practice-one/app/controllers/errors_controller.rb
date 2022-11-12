class ErrorsController < ApplicationController
  def show
    debugger
    @exception = request.env["action_dispatch.exception"]
    @status_code = ActionDispatch::ExceptionWrapper.status_code_for_exception(@exception.class.name)
    render file: "#{Rails.root}/public/#{request.path[1..-1]}.html", template: false

    private
    def view_for_status_code(statuscode)
      "#{Rails.root}/public/#{request.path[1..-1]}.html"
    end
  end
end
