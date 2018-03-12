CREATE TABLE users
(
	id INT PRIMARY KEY NOT NULL,
	username VARCHAR(50) UNIQUE,
	email VARCHAR(255) UNIQUE, 
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	birthdate timestamp,
	biography TEXT,
	age age(birthdate),
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