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
)
-- user photos table 
CREATE TABLE photos
(
	user_id INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE, 
	link VARCHAR(255) NOT NULL,
	PRIMARY KEY(user_id, link)
)

-- songs liked by users 
CREATE TABLE users_like_songs
(
	user_id INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	song_id INT NOT NULL, 
	PRIMARY KEY(user_id, song_id)
)


-- interests of user
CREATE TABLE users_have_interests
(
	user_id INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	tag VARCHAR(20),
	PRIMARY KET(user_id,tag)
)

-- Friends Table
CREATE TABLE friends
(
	user1 INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	user2 INT NOT NULL REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(user1, user2)
)