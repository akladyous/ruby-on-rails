class ApplicationController < ActionController::API
  def json_render(object, status: :ok)
    render json: object, status: status
  end
end
