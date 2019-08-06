require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/event'
# require_relative 'models/attendee'

user1 = User.new
user1.email = 'pa@gmail.com'
user1.password = 'abcd'
user1.username = 'pammy'
user1.name = 'Pam Ablang'
user1.image_url = 'https://secure.meetupstatic.com/photos/member/3/4/d/2/member_203653522.jpeg'
user1.phone = '0403928202'
user1.about_me = 'this is my about me. i write stuff about me here. Flanders sucks. Flanders sucks. Flanders sucks. Flanders sucks.'
user1.skills = 'muay thai, welding'
user1.interests = 'coding, free-diving'
user1.save

user2 = User.new
user2.email = 'frankie@home.com'
user2.password = 'abcd'
user2.username = 'doggo'
user2.name = 'frankie'
user2.image_url = 'https://i.imgur.com/naZWgBW.png'
user2.phone = '0403928202'
user2.about_me = 'this is my about me. i write stuff about me here. Flanders sucks. Flanders sucks. Flanders sucks. Flanders sucks.'
user2.skills = 'barking, fetching'
user2.interests = 'sleeping'
user2.save

user3 = User.new
user3.email = 'migs@here.com'
user3.password = 'abcd'
user3.username = 'miggy'
user3.name = 'Mig Uel'
user3.image_url = 'https://i.imgur.com/lA9sZmf.jpg'
user3.phone = '0403928202'
user3.about_me = 'this is my about me. i write stuff about me here. Flanders sucks. Flanders sucks. Flanders sucks. Flanders sucks.'
user3.skills = 'sailing'
user3.interests = 'welding'
user3.save

event1 = Event.new
event1.name = 'Welding workshop'
event1.date_time = '2019/08/28'
event1.location = 'coburg'
event1.image_url = 'https://i.imgur.com/VjPeBH3.jpg'
event1.description = 'arc welding for beginners'
event1.user_id = 1 # pammy
event1.save

event2 = Event.new
event2.name = 'Coding workshop'
event2.date_time = '2019/08/02 13:00'
event2.location = 'melbourne'
event2.image_url = 'https://i.imgur.com/xDHXEPo.jpg'
event2.description = 'coding for beginners'
event2.user_id = 2 # frankie
event2.save

event3 = Event.new
event3.name = 'yoga'
event3.date_time = '2019/05/02 07:00'
event3.location = 'brunswick'
event3.image_url = 'https://i.imgur.com/C0kBo9r.jpg'
event3.description = 'yoga on the beach'
event3.user_id = 1 # miguel
event3.save

c = Comment.new
c.user_id = 1
c.body = 'Doggo ipsum very taste wow big ol pupper most angery pupper I have ever seen, heckin. Puggo very taste wow you are doing me the shock noodle horse, wrinkler.'
c.received_user_id = 2
c.save

# user3.events << event2
# user3.events << event3

# event1.users << user3

# attendee1 = Attendee.new
# attendee1.user_id = 2
# attendee1.event_id = 1
# attendee1.save

# attendee2 = Attendee.new
# attendee2.user_id = 3
# attendee2.event_id = 3
# attendee2.save

# attendee3 = Attendee.new
# attendee3.user_id = 2
# attendee3.event_id = 2
# attendee3.save

# attendee4 = Attendee.new
# attendee4.user_id = 1
# attendee4.event_id = 2
# attendee4.save
