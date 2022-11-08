class TextValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if value.size < 3
      record.errors.add(attribute, :invalid, message: 'must be 3 characters')
    end
  end

end
