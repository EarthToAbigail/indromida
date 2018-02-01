# NOSQL Collections: 

This is the expected design of the collections for the mongoDB including some constraints on the attributes.

## Rules

- constraints are written as follow {constraint1, constraint2,...., constraint n}
- Array of objects are written as follow : /[1. attribute1 2. attribute2 ... n. attributen /]

## Collections:

- Users: 
	1. _id {unique}
	2. username {unique}
	3. email {unique, NOT NULL}
	4. firstname
	5. lastname 
	6. biography
	7. gender
	8. cellphone
	9. profile_picture
	10. password_hash
	11. birthdate
	12. country
	13. city
	14. profile_privacy
	15. message_privacy
	16. created_at
	17. photos\[
		1. link	
	    \]
	18. songs: \[
		1. spotify_id 
	    \]
	19. interests: \[
		1. tag
	\]
	20. likes: \[
		1. user_id
	\]
	21. facebook_id (optional)
	22. gmail_id (optional)
	23. twitter_id (optional)
	24. user_type
	25. instruments: \[
		1. name
	\] (optional)
	26. notifications: \[
		1.notification_type
		2.created_at
		3.seen_at
		4.sender_id
	\]


- Friends: 
	1. _id
	2. _id2 
unique(_id1, _id2)

- Projects: 
	1. _id {unique}
	2. user_id
	3. title
	4. date
	5. genre
	6. n_participants
	7. location
	8. Description
	9. instruments: \[
		1. instrument
	\]
	10. interested_musicians: \[
		1.user_id
	\]

-Chats: 
	1._id
	2.chat_title
	3.chat_description
	4.members: \[
		1.user_id
	\] 
	5.message: \[
		1. sender_id
		2. content
		3. sent_at
		4. seen_at
		5. delivered_at
	\]
	