module RescueHandler

  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordInvalid do |e|

    end
    rescue_from ActiveRecord::RecordNotFound do |e|

    end

    rescue_from StandardError do |e|

    end

  end
end
