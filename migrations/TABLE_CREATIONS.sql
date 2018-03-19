-- users table 
CREATE TABLE users
(
	id INT PRIMARY KEY NOT NULL,
	username VARCHAR(50) UNIQUE,
	email VARCHAR(255) UNIQUE, 
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	birthdate timestamp,
	biography TEXT,
	gender BIT, -- [1: Female, 0: Male, NULL: Other]
	phone VARCHAR(100),
	profile_picture VARCHAR(255), --Location of the profile picture
	password_hash VARCHAR(255),
	country VARCHAR(60),
	city VARCHAR(60),
	profile_privacy BIT, -- [1: All, 0: Friends, NULL: none]
	messaging_privacy BIT,  -- [1: All, 0: Friends, NULL: none]
	created_at timestamp, 
	updated_at timestamp
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
	song_id INT NOT NULL, 
	PRIMARY KEY(user_id, song_id)
);


-- interests of user
CREATE TABLE users_have_interests
(
	user_id INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	tag VARCHAR(20),
	PRIMARY KET(user_id,tag)
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
	facebook_id INT NOT NULL, 
	facebook_email VARCHAR(150)
);

--google login data
CREATE TABLE google_info
(
	user_id INT PRIMARY KEY NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	google_id INT NOT NULL, 
	google_email VARCHAR(150)
);


-- twitter login data

CREATE TABLE twitter_info
(
	user_id INT PRIMARY KEY NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	google_id INT NOT NULL, 
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
	pid INT PRIMARY KEY,
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
	chat_description TEXT
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
	message_id INT PRIMARY KEY,
	chat_id INT REFERENCES chats ON DELETE CASCADE ON UPDATE CASCADE,
	sender_id INT REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	content TEXT, 
	sent_at timestamp,
	seen_at timestamp,
	delivered_at timestamp
);

-- Notification sent when someone likes a profile
CREATE TABLE like_notifications
(
	not_id INT PRIMARY KEY,
	created_at timestamp,
	seen_at timestamp,
	sent_to INT REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE, 
	sent_from INT REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE
);

