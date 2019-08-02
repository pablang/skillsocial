class Users < ActiveRecord::Base
    has_many :events
    belongs_to :attendees
    has_secure_password
end