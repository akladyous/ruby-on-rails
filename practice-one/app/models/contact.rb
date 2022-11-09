class Contact
  include ActiveModel::Naming
  include ActiveModel::Conversion
  extend ActiveModel::Validations

  def initialize(attributes={})
    attributes.each do |att, value|
      send("#{name}=", value)
    end
  end


  def persisted?
    false
  end
end
