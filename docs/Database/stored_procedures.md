# Stored Procedures in The Database: 
This document describes the stored procedures in our database.

## Milestone 1 **_"Users"_**: 
1. **Register:** Takes all the relevant information and creates new user in the database. Makes sure the user enters an email, first name, last name,birthdate and gender. All the other infromation is optional. Sets the profile_privacy and messaging_privacy to public by default. 

2. **Facebook_Register:** if the user already exists Select over the existing user. Otherwise insert in the facebook database a new entry with ID and insert a new record in the user table with his first and last name and any other provided information.

3. **Google_Regsiter:** Same as the facebook register but the insertion occurs in the goole table.

4. **Twitter_Register:** Same as the facebook register

5. **Login:** Given the email or username Selects over the username, email, ID and password

6. **Login_Facebook:** Selects over the facebook id Joined with the user table

7. **Login_Gmail:** Same deal as with facebook.

8. **Login_Twitter:** Same deal as with facebook.

9. **Destroy_user:** Given the ID of the user deletes the user from the user table and any existing record in the twitter, facebook or google's tables.

10. **Update_user:** Given the user id and the attributes to be updated, updates the user's record in the users table. 

11. **Get_user:** Given the user id, Selects over all the attributes of the user. 

12. **setUserType:** Inserts the user_id in either the musician table or the user table according to the Given the Boolean. If the boolean is true adds him to the musician table. 

## Milestone 2 **_"Musicians"_**:

1. **Create_project:** Given the musician_id and the projects info inserts a new project.

2. **Selects_nearby_projects:** Given a location Selects all the nearby projects and returns info about it and about it's creator. Make sure all the returned projects date has not passed yet.

3. **Delete_project:** Given the user_id and the title of a project, deletes this project.

4. **Update_project:** Given the attributes of the project, updates this project. 

5. **select_pontential_project:** Given the instrument gets a project the needs someone who can play this instrument. 