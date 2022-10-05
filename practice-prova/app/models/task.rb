class Task < ApplicationRecord
  validates :name, presence: true

  after_create_commit { broadcast_prepend_to :tasks }

  # broadcasts

  private
  def prepend_task
    broadcast_prepend_to "tasks_list"
  end
end
