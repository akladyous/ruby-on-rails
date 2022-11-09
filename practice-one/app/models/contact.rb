class Contact
  include ActiveModel::Naming
  include ActiveModel::Conversion
  extend ActiveModel::Validations

  attr_accessor :email, :content, :content

  def initialize(attributes={})
    attributes.each do |att, value|
      send("#{name}=", value)
    end
  end

  validates :email, :subject, :content, presence: true

  def persisted?
    false
  end
end
