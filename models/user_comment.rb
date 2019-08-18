class UserComment < ActiveRecord::Base
  belongs_to :teacher, :class_name => 'User'
  belongs_to :student_comment, :class_name => 'Comment'
end