class User < ActiveRecord::Base
  has_many :events, dependent: :destroy # as creator
  has_many :event_subscriptions, :foreign_key => :subscribed_user_id # as user to many events
  has_many :subscribed_events, :through => :event_subscriptions # events they are attending

  has_many :user_comments, :foreign_key => :teacher_id
  has_many :student_comments, :through => :user_comments


  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'Invalid email format' }, uniqueness: true, presence: true

  has_secure_password
end
