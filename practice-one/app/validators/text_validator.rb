class TextValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if value.size < 10
      record.errors.add(attribute, :invalid, message: 'must be 10 characters')
    end
  end

end
