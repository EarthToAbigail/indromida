-- users table 
CREATE TABLE users
(
	id serial PRIMARY KEY,
	username VARCHAR(100) UNIQUE,
	email VARCHAR(255) UNIQUE, 
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	birthdate TIMESTAMP,
	biography TEXT,
	gender BIT, -- [1: Female, 0: Male, NULL: Other]
	phone VARCHAR(100),
	profile_picture VARCHAR(255), --Location of the profile picture
	password_hash VARCHAR(255),
	country VARCHAR(100),
	city VARCHAR(100),
	profile_privacy BIT, -- [1: All, 0: Friends, NULL: none]
	messaging_privacy BIT,  -- [1: All, 0: Friends, NULL: none]
	created_at TIMESTAMP, 
	updated_at TIMESTAMP
);
-- user photos table 
CREATE TABLE photos
(
	user_id INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE, 
	link VARCHAR(255) NOT NULL,
	PRIMARY KEY(user_id, link)
);

-- songs liked by users 
CREATE TABLE users_like_songs
(
	user_id INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	song_id TEXT NOT NULL, 
	PRIMARY KEY(user_id, song_id)
);


-- interests of user
CREATE TABLE users_have_interests
(
	user_id INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	tag VARCHAR(20),
	PRIMARY KEY(user_id,tag)
);

-- Friends Table (Symmetric relation)
CREATE TABLE friends
(
	user1 INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	user2 INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(user1, user2)
);
-- user likes other user (Asymmetric relation)
CREATE TABLE likes
(
	user1 INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	user2 INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(user1, user2)
);
-- facebook login data
CREATE TABLE facebook_infos
(
	user_id INT PRIMARY KEY NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	facebook_id TEXT NOT NULL, 
	facebook_email VARCHAR(150)
);

--google login data
CREATE TABLE google_info
(
	user_id INT PRIMARY KEY NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	google_id TEXT NOT NULL, 
	google_email VARCHAR(150)
);


-- twitter login data

CREATE TABLE twitter_info
(
	user_id INT PRIMARY KEY NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	google_id TEXT NOT NULL, 
	google_email VARCHAR(150)
);

-- Musicians 
CREATE TABLE musicians
(
	user_id INT PRIMARY KEY NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE
);

-- instruments played by a musician
CREATE TABLE musicians_play_instruments	
(
	user_id INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	instrument VARCHAR(100),
	PRIMARY KEY (user_id, instrument)
);

-- Project created by a musician
CREATE TABLE projects
( 
	pid serial PRIMARY KEY,
	user_id INT NOT NULL REFERENCES musicians ON DELETE CASCADE ON UPDATE CASCADE,
	title VARCHAR(150), 
	date timestamp,
	genre VARCHAR(150),
	n_participant INT, 
	location VARCHAR, 
	Description TEXT
);
-- instruments needed for a certain project
CREATE TABLE projects_require_instruments
(	
	pid INT NOT NULL REFERENCES projects ON DELETE CASCADE ON UPDATE CASCADE,
	instrument VARCHAR(150),
	PRIMARY KEY (pid, instrument)
 );

-- musicians interested in participating in a certain job
CREATE TABLE musicians_interested_projects
(
	user_id INT NOT NULL REFERENCES musicians ON DELETE CASCADE ON UPDATE CASCADE,
	pid INT NOT NULL REFERENCES projects ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (user_id, pid)
);

-- information a chat
CREATE TABLE chats
(
	chat_id INT PRIMARY KEY,
	chat_title VARCHAR(100), 
	chat_description TEXT,
	created_at TIMESTAMP,
	updated_at TIMESTAMP
);

-- members of a certain chat
CREATE TABLE users_members_of_chats
(
	chat_id INT REFERENCES chats ON DELETE CASCADE ON UPDATE CASCADE,
	user_id INT REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(chat_id, user_id)
);




-- Messages sent to a certain chat
CREATE TABLE messages
(
	mid SERIAL PRIMARY KEY,
	chat_id INT REFERENCES chats ON DELETE CASCADE ON UPDATE CASCADE,
	sender_id INT REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	content TEXT NOT NULL, 
	sent_at timestamp NOT NULL,
	delivered_at timestamp
);


-- Generic Notifications

CREATE TABLE IF NOT EXISTS "notifications" (
  "not_id" serial PRIMARY KEY,
  "receiver_id" integer NOT NULL REFERENCES users ON DELETE cascade ON UPDATE cascade,
  "content" text,
  "url" text,
  "created_at" timestamp NOT NULL,
  "seen_at" timestamp
);


-- Notification sent when someone likes a profile
CREATE TABLE IF NOT EXISTS "like_notifications" 
(
  "not_id" integer PRIMARY KEY NOT NULL REFERENCES notifications ON DELETE cascade ON UPDATE cascade,
  "sender_id" integer NOT NULL REFERENCES users ON DELETE cascade ON UPDATE cascade
);

-- Notification sent when there is an update on project you created or a project you follow
CREATE TABLE IF NOT EXISTS "project_notifications" 
(
  "not_id" integer PRIMARY KEY NOT NULL REFERENCES notifications ON DELETE cascade ON UPDATE cascade,
  "pid" integer NOT NULL REFERENCES projects ON DELETE cascade ON UPDATE cascade
);

