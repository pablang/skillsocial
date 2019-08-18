class Like < ActiveRecord::Base
  belongs_to :user
  has_many :user_likes, :foreign_key => :student_like_id
  has_many :teachers, :through => :user_likes
end