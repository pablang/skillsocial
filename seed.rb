

user = Users.new
user.email = 'pa@gmail.com'
user.password = 'abcd'
user.username = 'pammy'
user.name = 'Pam Ablang'
user.image_url = 'https://secure.meetupstatic.com/photos/member/3/4/d/2/member_203653522.jpeg'
user.phone = '0403928202'
user.about_me = "this is my about me. i write stuff about me here. Flanders sucks. Flanders sucks. Flanders sucks. Flanders sucks."
user.skills = 'filipino cooking', 'welding', 'muay thai'
user.interests = 'coding', 'diving'
user.save

user = Users.new
user.email = 'frankie@home.com'
user.password = 'abcd'
user.username = 'doggo'
user.name = 'frankie'
user.image_url = 'https://i.imgur.com/naZWgBW.png'
user.phone = '0403928202'
user.about_me = "this is my about me. i write stuff about me here. Flanders sucks. Flanders sucks. Flanders sucks. Flanders sucks."
user.skills = 'barking, fetching'
user.interests = 'sleeping'
user.save

user = Users.new
user.email = 'migs@here.com'
user.password = 'abcd'
user.username = 'miggy'
user.name = 'Mig Uel'
user.image_url = 'https://i.imgur.com/lA9sZmf.jpg'
user.phone = '0403928202'
user.about_me = "this is my about me. i write stuff about me here. Flanders sucks. Flanders sucks. Flanders sucks. Flanders sucks."
user.skills = 'sailing'
user.interests = 'welding'
user.save

event = Events.new
event.name = "Welding workshop"
event.date_time = '2019/08/28'
event.location = "coburg"
event.description = 'arc welding for beginners'
event.creator_id = 1
event.save

event = Events.new
event.name = "Coding workshop"
event.date_time = '2019/08/02 13:00'
event.location = "melbourne"
event.description = 'coding for beginners'
event.creator_id = 2
event.save

event = Events.new
event.name = "yoga"
event.date_time = '2019/05/02 07:00'
event.location = "brunswick"
event.description = 'yoga on the beach'
event.creator_id = 1
event.save

attendee = Attendees.new
attendee.user_id = 2
attendee.event_id = 1
attendee.save

attendee = Attendees.new
attendee.user_id = 3
attendee.event_id = 3
attendee.save


attendee = Attendees.new
attendee.user_id = 2
attendee.event_id = 2
attendee.save

attendee = Attendees.new
attendee.user_id = 1
attendee.event_id = 2
attendee.save
