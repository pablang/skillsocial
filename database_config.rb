require 'active_record'

options = {
    adapter: 'postgresql',
    database: 'skillsocial'
}

ActiveRecord::Base.establish_connection(options)
