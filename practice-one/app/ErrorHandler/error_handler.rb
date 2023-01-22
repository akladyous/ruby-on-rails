module ErrorHandler
  extend ActiveSupport::Concern

  ERRORS = [
    "ActiveRecord::RecordInvalid",
    "ActiveRecord::RecordNotFound",
    "ActiveRecord::RecordNotUnique",
    "ActiveRecord::InvalidForeignKey",
    "ActiveRecord::RecordNotSave"
  ]

  included do
    ERRORS.each do |mod|
      rescue_from mod&.constantize, with: Proc.new { |exception| handle_error(exception) }
    end
  end

  private

  def handle_error(e)
    debugger
    error_class = e.class.name
    return e if ERRORS.include? error_class

  end

end