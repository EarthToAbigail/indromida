#  Database Schema
## Rules
----------------------
- Bold and Italics: the relation name
- Bold attributes: primary keys
- foriegn keys ar mentioned below the relation as bullet points
## Schema:

users(**id**, username, email, firstname, lastname, age, biography, gender, cellphone, profile_picture, hash, birthdate,country, city, profile_privacy, messaging_privacy, created_at)

- age as Time(now) – birthdate

photos(**user_id, link**)
- user_id references User

users_like_Songs(**user_id, Song_id**)

- user_id references User

users_have_interests(**user_id, tag**)

- User_id references User

friends(**user1, user2**)

- user1 references User
- user2 references User

likes(**user1, user2**)

- user1 references User
- user2 references User

facebook_infos(**user_id**, facebook_id, facebook_mail)

- user_id references User

google_infos(**user_id**, g_id, gmail)

- user_id references User

twitter_infos(**user_id**, twitter_id, twitter_mail)

- user_id references User


regular_users(**user_id**)

- user_id references User

musicians(**user_id**)

- user_id references User



musicians_play_instruments(**user_id, instrument**)

- user_id references Musician

projects(pid ,user_id, title, date, genre ,n_participant, location, Description)

- user_id references Musician

projects_require_instruments(**pid, instrument**)

- pid references Project


musicians_interested_projects(**user_id, pid**)

- int_user_id references Musician
- pid references Project

chats(**chat_id**, chat_title, chat_description)

users_members_of_chats(**chat_id, user_id**)

- chat_id references Chat
- user_id references User

messages(**message_id**, chat_id, sender_id, content, sent_at, seen_at, delivered_at)

- chat_id references Chat.chat_id
- send_id references User

like_notifications(**not_id**, created_at, seen_at, sent_to, sent_from)

- sent_to references User
- sent_from references User