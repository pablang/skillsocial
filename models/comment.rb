class Comment < ActiveRecord::Base
  belongs_to :user # the creating User
  has_many :user_comments, :foreign_key => :student_comment_id
  has_many :teachers, :through => :user_comments
end
