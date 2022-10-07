class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :subject, :message

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
      # instance_variable_set("@#{name}", value)
    end
  end

  validates_presence_of :name, :email, :subject, :message
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def persisted?
    false
  end
end
