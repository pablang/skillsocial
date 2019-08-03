class User < ActiveRecord::Base
    has_many :events # as creator
    has_many :event_subscriptions, :foreign_key => :subscribed_user_id # as user to many events
    has_many :subscribed_events, :through => :event_subscriptions  # events they are attending
    has_many :comments # given to other users
    has_secure_password
end

