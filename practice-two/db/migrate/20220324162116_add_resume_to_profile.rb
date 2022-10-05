class AddResumeToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :resume, :text
  end
end
