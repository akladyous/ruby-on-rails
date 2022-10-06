module ApplicationHelper


  def bootstrap_class_for(flash_type)
    classes = {
      success:  'alert alert-success alert-dismissible fade show',
      error:    'alert alert-danger alert-dismissible fade show',
      alert:    'alert alert-warning alert-dismissible fade show',
      notice:   'alert alert-info alert-dismissible fade show'
    }
    classes[flash_type.to_sym] || classes[:notice]
  end

  def object_errors_for(object, attribute)
    return nil unless object.errors.any?
    if object.errors.has_key? attribute
      return content_tag :div, nil, { class: 'd-block '} do
        content_tag :p, object.errors.full_messages_for(attribute).to_sentence, class: 'mb-0'
      end
    end
  end
end
