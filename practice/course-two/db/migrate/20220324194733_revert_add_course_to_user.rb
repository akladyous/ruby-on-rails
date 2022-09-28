require_relative  '20220324194647_add_coursed_to_user'
class RevertAddCourseToUser < ActiveRecord::Migration[7.0]
    def change
        revert AddCoursedToUser
    end
end
