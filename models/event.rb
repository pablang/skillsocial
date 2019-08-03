class Event < ActiveRecord::Base
    belongs_to :user  # the creating User
    has_many :event_subscriptions, :foreign_key => :subscribed_event_id # many events 
    has_many :subscribed_users, :through => :event_subscriptions   # subscribed Users
end