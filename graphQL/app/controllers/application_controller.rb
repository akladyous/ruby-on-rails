class ApplicationController < ActionController::API
  include RescueHandler
  include ActionController::MimeResponds

  def json_render(object, status: :ok)
    render json: object, status: status
  end
end
