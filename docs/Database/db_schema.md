#  Database Schema
## Rules
----------------------
- Bold and Italics: the relation name
- Bold attributes: primary keys
- foriegn keys ar mentioned below the relation as bullet points
## Schema:

Users(**id**, username, email, firstname, lastname, age, biography, gender, cellphone, profile_picture, hash, birthdate,country, city, profile_privacy, messaging_privacy, created_at)

- age as Time(now) – birthdate

Photos(**user_id, link**)
- user_id references User

Users_like_Songs(**user_id, Song_id**)

- user_id references User

Users_have_interests(**user_id, tag**)

- User_id references User

Friends(**user1, user2**)

- user1 references User
- user2 references User
Likes(**user1, user2**)

- user1 references User
- user2 references User

Facebook_infos(**user_id**, facebook_id, facebook_mail)

- user_id references User

Google_infos(**user_id**, g_id, gmail)

- user_id references User

Twitter_infos(**user_id**, twitter_id, twitter_mail)

- user_id references User


Regular_users(**user_id**)

- user_id references User

Musicians(**user_id**)

- user_id references User



Musicians_play_instruments(**user_id, instrument**)

- user_id references Musician

Projects(pid ,user_id, title, date, genre ,n_participant, location, Description)

- user_id references Musician

Projects_require_instruments(**pid, instrument**)

- pid references Project


Musicians_interested_projects(**user_id, pid**)

- int_user_id references Musician
- pid references Project

Chats(**chat_id**, chat_title, chat_description, created_at, updated_at)

Users_members_of_chats(**chat_id, user_id**)

- chat_id references Chat
- user_id references User

Messages(**chat_id, sender_id**, content, sent_at, delivered_at)

- chat_id references Chat.chat_id
- send_id references User

Notifications(**not_id**, receiver_id, content, url, created_at, seen_at)

Like_notifications(**not_id**, sender)

- not_id references Notifications
- sender references Users


Project_notifications(**not_id**, pid)

- not_id references Notifications
- pid references Project
 