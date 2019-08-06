class EventSubscription < ActiveRecord::Base
  belongs_to :subscribed_user, :class_name => 'User'
  belongs_to :subscribed_event, :class_name => 'Event'
end
