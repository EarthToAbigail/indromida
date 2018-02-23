#  Database Schema
## Rules
----------------------
- Bold and Italics: the relation name
- Bold attributes: primary keys
- foriegn keys ar mentioned below the relation as bullet points
## Schema:

User(**id**, username, email, firstname, lastname, age, biography, gender, cellphone, profile_picture, hash, birthdate,country, city, profile_privacy, messaging_privacy, created_at)

- age as Time(now) – birthdate

Photo(**user_id, link**)
- user_id references User

User_likes_Song(**user_id, Song_id**)

- user_id references User

User_has_interests(**user_id, tag**)

- User_id references User

Friends(**user1, user2**)

- user1 references User
- user2 references User
Likes(**user1, user2**)

- user1 references User
- user2 references User

Facebook_Info(**user_id**, facebook_id, facebook_mail)

- user_id references User

Google_Info(**user_id**, g_id, gmail)

- user_id references User

Twitter_Info(**user_id**, twitter_id, twitter_mail)

- user_id references User


Regular_user(**user_id**)

- user_id references User

Musician(**user_id**)

- user_id references User



musician_plays_instrument(**user_id, instrument**)

- user_id references Musician

Project(pid ,user_id, title, date, genre ,n_participant, location, Description)

- user_id references Musician

project_requires_instrument(**pid, instrument**)

- pid references Project


musician_interested_project(**user_id, pid**)

- int_user_id references Musician
- pid references Project

Chat(**chat_id**, chat_title, chat_description)

User_Member_Of_Chat(**chat_id, user_id**)

- chat_id references Chat
- user_id references User

Message(**chat_id, sender_id**, content, sent_at, seen_at, delivered_at)

- chat_id references Chat.chat_id
- send_id references User

Like_Notification(**not_id**, created_at, seen_at, sent_to, sent_from)

- sent_to references User
- sent_from references User

project_Notification(**not_id**, created_at, seen_at, sent_to, pid)
- sent_to references User
- user_id, title references Project
 