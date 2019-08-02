class Users < ActiveRecord::Base
    belongs_to :event
    belongs_to :attendees
    has_secure_password
end