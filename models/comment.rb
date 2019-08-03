class Comment < ActiveRecord::Base
    belongs_to :user  # the creating User
end