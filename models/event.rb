class Events < ActiveRecord::Base
    has_many :attendees
    belongs_to :user
end