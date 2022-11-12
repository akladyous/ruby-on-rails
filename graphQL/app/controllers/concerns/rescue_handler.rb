module RescueHandler
  extend ActiveSupport::Concern

  # rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  # def invalid_record(e)
  #   json_render({message: e.message}, status: :unprocessable_entity)
  # end


  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      debugger
      json_render({message: e.message}, status: :unprocessable_entity)
    end
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_render({message: e.message}, status: :not_found)
    end
    rescue_from StandardError do |e|
      json_render({message: e.message}, status: :unprocessable_entity)
    end

  end
end
