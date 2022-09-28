class Blog < ApplicationRecord

  # after_update_commit { broadcast_prepend_to(target: "#{self.model_name.singular}_#{self.id}}") }
  # after_create_commit { broadcast_prepend_to(target: "#{self.model_name.singular}_#{self.id}}") }

  # broadcasts
end
