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
end
